import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomBanner extends StatelessWidget {
  final String image;

  const CustomBanner({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 200,
      margin: EdgeInsets.only(right: defaultMargin, bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: redColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
