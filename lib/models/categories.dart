class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    title: "All Items",
    image: "images/all.png",
  ),
  Category(
    title: "Shoes",
    image: "images/shoe-icon.jpg",
  ),
  Category(
    title: "Beauty",
    image: "images/beauty-icon.jpg",
  ),
];
