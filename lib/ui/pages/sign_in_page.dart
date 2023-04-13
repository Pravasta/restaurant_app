import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/widgets/custom_button.dart';
import 'package:restaurant_app/ui/widgets/custom_text_field.dart';
import 'package:restaurant_app/ui/widgets/custom_text_field_pass.dart';
import '../../shared/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget customFieldEmail(String text) {
      return CustomTextField(
        title: text,
        hintText: text,
        controller: TextEditingController(),
      );
    }

    Widget customFieldPass(String text) {
      return CustomTextFieldPass(
        title: text,
        hintText: text,
        obsPass: true,
        controller: TextEditingController(),
      );
    }

    Widget customButtonLogin(String text) {
      return CustomButton(
        backGroundColor: primaryColor,
        title: text,
        margin: const EdgeInsets.only(top: 40),
        style: whiteTextStyle.copyWith(
          fontSize: 18,
          fontWeight: reguler,
        ),
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context, '/main-page', (route) => false),
      );
    }

    Widget buttonText(BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 24),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, '/sign-up'),
          child: Text(
            "Doesn't have an account?  Sign Up",
            textAlign: TextAlign.center,
            style: greyTextStyle.copyWith(
              fontSize: 18,
              fontWeight: reguler,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        title: Text(
          'Login',
          style: blackTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 50,
          horizontal: defaultMargin,
        ),
        child: ListView(
          children: [
            customFieldEmail('Email'),
            customFieldPass('Password'),
            customButtonLogin('Login'),
            buttonText(context)
          ],
        ),
      ),
    );
  }
}
