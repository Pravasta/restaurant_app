import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubit/restaurant_cubit.dart';
import '/shared/theme.dart';
import '/ui/widgets/custom_banner.dart';
import '/ui/widgets/custom_icon.dart';
import '/ui/widgets/restaurant_card.dart';

import '../../models/restaurant_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<RestaurantCubit>().getDataRes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantState>(
      listener: (context, state) {
        if (state is RestaurantFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: greyColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is RestaurantSucces) {
          return ListView(
            children: [
              header(context),
              bannerWidget(),
              indicatorWidget(),
              anyWidgetIcon(context),
              recomendation(context),
              listRestaurant(state.res)
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget anyWidgetIcon(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: defaultMargin, left: defaultMargin, bottom: 40),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CustomIcon(
            title: 'Food',
            image: 'assets/food.png',
          ),
          CustomIcon(
            title: 'Food',
            image: 'assets/table.png',
          ),
          CustomIcon(
            title: 'Food',
            image: 'assets/payment.png',
          ),
          CustomIcon(
            title: 'Food',
            image: 'assets/more.png',
          ),
        ],
      ),
    );
  }

  Widget bannerWidget() {
    return Container(
      margin: EdgeInsets.only(left: defaultMargin),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            CustomBanner(
              image: 'assets/banner1.jpg',
            ),
            CustomBanner(
              image: 'assets/banner2.jpg',
            ),
            CustomBanner(
              image: 'assets/banner3.jpg',
            ),
            CustomBanner(
              image: 'assets/banner3.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget indicatorWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: defaultMargin),
      width: 10,
      height: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            width: 10,
            margin: const EdgeInsets.only(right: 10),
            height: 10,
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }

  Widget recomendation(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Text(
        'Rekomendasi Restaurant',
        style: blackTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: 40,
        bottom: 24,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Pravasta',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Get your favorite food here!',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: greyColor,
              size: 26,
            ),
          )
        ],
      ),
    );
  }

  Widget listRestaurant(List<Restaurant> res) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        bottom: 83,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: res
              .map(
                (Restaurant res) => RestaurantCard(
                  restaurant: res,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
