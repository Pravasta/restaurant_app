import 'package:flutter/material.dart';
import 'package:restaurant_app/shared/theme.dart';
import 'package:restaurant_app/ui/widgets/custom_button.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Madang',
              style: greenTextStyle.copyWith(
                fontSize: 32,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Booking a table and food from\neverywhere.',
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
            CustomButton(
              onPressed: () => Navigator.pushNamed(context, '/sign-up'),
              backGroundColor: primaryColor,
              title: 'Sign Up',
              margin: const EdgeInsets.only(top: 140),
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            CustomButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              backGroundColor: whiteColor,
              title: 'Login',
              margin: const EdgeInsets.only(top: 24),
              style: greenTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
