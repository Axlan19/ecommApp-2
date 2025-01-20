import 'package:flutter/material.dart';
import 'package:sececommerce/data/database_service.dart'; // Import DatabaseService
import 'package:sececommerce/models/categories.dart'; // Import Category model

class CategoriesDb extends StatelessWidget {
  const CategoriesDb({super.key});

  // Fetch categories from the database
  Future<List<Category>> fetchCategoriesFromDb() async {
    final List<Map<String, dynamic>> categoryData =
        await DatabaseService.fetchCategories();
    return categoryData.map((category) {
      return Category(
        title: category['title'],
        image: category['image'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: FutureBuilder<List<Category>>(
        future: fetchCategoriesFromDb(), // Fetch categories from DB
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while data is being fetched
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Show error message if something goes wrong
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Show message if no data is found
            return Center(child: Text('cannot connect to server'));
          }

          // Use the fetched data
          final categoriesList = snapshot.data!;

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(categoriesList[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    categoriesList[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
          );
        },
      ),
    );
  }
}
