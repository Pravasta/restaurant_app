import 'package:flutter/material.dart';
import 'package:restaurant_app/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 64,
            margin: EdgeInsets.only(
              top: 40,
              bottom: 24,
              left: defaultMargin,
              right: defaultMargin,
            ),
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
