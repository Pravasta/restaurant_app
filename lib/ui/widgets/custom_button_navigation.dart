import '/cubit/page_cubit.dart';

import '/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int index;
  final String image;
  final String title;
  // ignore: prefer_const_constructors_in_immutables
  CustomBottomNavigation({
    super.key,
    required this.index,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return context.read<PageCubit>().indexPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            image,
            width: 24,
            fit: BoxFit.cover,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? primaryColor
                : greyColor,
          ),
          Text(
            title,
            style: greenTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              color: context.read<PageCubit>().state == index
                  ? primaryColor
                  : greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
