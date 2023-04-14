import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubit/page_cubit.dart';
import '/shared/theme.dart';
import '/ui/pages/home_page.dart';
import '/ui/pages/profile_page.dart';
import '/ui/pages/recent_page.dart';
import '/ui/pages/search_page.dart';

import '../widgets/custom_button_navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Untuk index page
    Widget indexPage(int currIndex) {
      switch (currIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const SearchPage();
        case 2:
          return const RecentPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    // Untuk bottomNav
    Widget customBottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 12),
          width: MediaQuery.of(context).size.width,
          height: 83,
          decoration: BoxDecoration(
            color: whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBottomNavigation(
                image: 'assets/home.png',
                index: 0,
                title: 'Home',
              ),
              CustomBottomNavigation(
                image: 'assets/search.png',
                index: 1,
                title: 'Search',
              ),
              CustomBottomNavigation(
                image: 'assets/refresh.png',
                index: 2,
                title: 'Recent',
              ),
              CustomBottomNavigation(
                image: 'assets/profile.png',
                index: 3,
                title: 'Profile',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currIndex) {
        return Scaffold(
          backgroundColor: backGroundColor,
          body: Stack(
            children: [
              indexPage(currIndex),
              customBottomNav(),
            ],
          ),
        );
      },
    );
  }
}
