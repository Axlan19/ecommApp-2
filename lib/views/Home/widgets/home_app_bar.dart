import 'package:flutter/material.dart';
import 'package:sececommerce/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
          style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(15)),
          onPressed: () {},
          iconSize: 30,
          icon: Icon(Icons.notifications_outlined))
    ]);
  }
}
