import 'package:flutter/material.dart';
import 'package:sececommerce/models/categories.dart';
import 'package:sececommerce/models/product_model.dart';
import 'package:sececommerce/views/Home/widgets/product_card.dart';

class CategoriesTap extends StatelessWidget {
  const CategoriesTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailScreen(
                    category: categoriesList[index],
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(categoriesList[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  categoriesList[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts;

    switch (category.title) {
      case "Shoes":
        filteredProducts = shoes; // Replace with your shoes list
        break;
      case "Beauty":
        filteredProducts = beauty; // Replace with your clothing list
        break;
      default:
        filteredProducts = all; // Empty if no match
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            // Row(
            //   children: [
            //     Text(
            //       "Special For You",
            //       style: TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.w800,
            //       ),
            //     ),
            //   ],
            // ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.78,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: filteredProducts[index]);
              },
            ),

            // Container(
            //   height: 200,
            //   width: 200,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage(category.image),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 20),
            // Text(
            //   category.title,
            //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 10),
            // const Text(
            //   'Details about this category can be added here.',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 16),
            // ),
          ],
        ),
      ),
    );
  }
}
