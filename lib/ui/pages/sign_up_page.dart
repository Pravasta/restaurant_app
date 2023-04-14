import 'package:flutter/material.dart';
import '/shared/theme.dart';
import '/ui/widgets/custom_button.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_field_pass.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: backGroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        title: Text(
          'Sign Up',
          style: blackTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
            letterSpacing: 0.2,
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
            textField('Name'),
            textField('Email'),
            textFieldPass('Password'),
            textFieldPass('Confirmation Password'),
            buttonSubmit(),
            buttonText(context),
          ],
        ),
      ),
    );
  }

  Widget buttonText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/login'),
        child: Text(
          'Already have an account?  Login',
          textAlign: TextAlign.center,
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: reguler,
          ),
        ),
      ),
    );
  }

  Widget buttonSubmit() {
    return CustomButton(
      backGroundColor: primaryColor,
      title: 'Sign Up Now',
      margin: const EdgeInsets.only(
        top: 40,
        bottom: 24,
      ),
      style: whiteTextStyle.copyWith(
        fontSize: 18,
      ),
      onPressed: () {},
    );
  }

  Widget textFieldPass(String text) {
    return CustomTextFieldPass(
      title: text,
      hintText: text,
      obsPass: true,
      controller: TextEditingController(),
    );
  }

  Widget textField(String text) {
    return CustomTextField(
      title: text,
      hintText: text,
      controller: TextEditingController(),
    );
  }
}
