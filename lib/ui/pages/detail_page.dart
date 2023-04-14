import 'package:flutter/material.dart';
import '/models/restaurant_models.dart';
import '/shared/theme.dart';

class DetailPage extends StatelessWidget {
  final Restaurant restaurant;

  const DetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              restaurant.pictureId,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 256,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 26,
                            fontWeight: bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          restaurant.city,
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        '${restaurant.rating}',
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    restaurant.description,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      height: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // MENU
            // Makanan
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Makanan',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: reguler,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: restaurant.menus.foods.map((foods) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 180,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/makanan_default.png',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              foods.name,
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  Text(
                    'Minuman',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: reguler,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 40),
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: restaurant.menus.drinks.map((drinks) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 180,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/minuman_default.jpg',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              drinks.name,
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            content(),
          ],
        ),
      ),
    );
  }
}
