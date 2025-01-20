import 'package:flutter/material.dart';
import 'package:sececommerce/constants.dart';
import 'package:sececommerce/views/Home/widgets/category_db.dart';
import 'package:sececommerce/views/Home/widgets/category_tap.dart';
import 'package:sececommerce/views/Home/widgets/image_slider.dart';
import 'package:sececommerce/views/Home/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const MySearchBar(), //search bar
              const SizedBox(height: 20),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              CategoriesTap(),
              const SizedBox(height: 20),
              CategoriesDb(),
            ],
          ),
        ),
      ),
    );
  }
}
