import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final Color backGroundColor;
  final Function() onPressed;
  final String title;
  final EdgeInsets margin;
  final TextStyle style;
  const CustomButton({
    super.key,
    required this.backGroundColor,
    required this.title,
    required this.margin,
    required this.style,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          side: BorderSide(
            color: primaryColor,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
