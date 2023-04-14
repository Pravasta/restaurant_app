import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubit/page_cubit.dart';
import '/cubit/restaurant_cubit.dart';
import '/ui/pages/main_page.dart';
import '/ui/pages/on_boarding_page.dart';
import '/ui/pages/sign_in_page.dart';
import '/ui/pages/sign_up_page.dart';
import '/ui/pages/splash_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => RestaurantCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/on-boarding': (context) => const OnBoardingPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/login': (context) => const LoginPage(),
          '/main-page': (context) => const MainPage(),
        },
      ),
    );
  }
}
