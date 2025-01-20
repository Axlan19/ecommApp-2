import 'package:flutter/material.dart';
import 'package:sececommerce/constants.dart';
import 'package:sececommerce/models/product_model.dart';
import 'package:sececommerce/views/details/detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(product: product),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kcontentColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Center(
                  child: Image.asset(
                    product.image,
                    width: 130,
                    height: 130,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    product.title,
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        product.colors.length,
                        (index) => Container(
                          width: 18,
                          height: 18,
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: product.colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
