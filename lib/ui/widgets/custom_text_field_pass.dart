import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextFieldPass extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obsPass;
  final TextEditingController controller;
  const CustomTextFieldPass({
    super.key,
    required this.title,
    required this.hintText,
    required this.obsPass,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: reguler,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: controller,
            cursorColor: blackColor,
            obscureText: obsPass,
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.remove_red_eye,
              ),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
