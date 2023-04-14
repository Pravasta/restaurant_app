import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomIcon extends StatelessWidget {
  final String title;
  final String image;
  const CustomIcon({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: whiteColor,
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                ),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
