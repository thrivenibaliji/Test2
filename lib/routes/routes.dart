
//import 'dart:math';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:triveni_3399/features/login/view/login_screen.dart';
import 'package:triveni_3399/features/login1/view/sign_screen.dart';


import 'package:triveni_3399/features/signin/view/signup_screen.dart';
import 'package:triveni_3399/features/splash/view/splash_screen.dart';
import 'package:triveni_3399/routes/routes_constants.dart';


class AppRouter {    


static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();


static final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesConstants.splashScreen,
  routes: <RouteBase>[
    GoRoute(
      path: RoutesConstants.splashScreen,
      builder: (BuildContext context, GoRouterState state) {
        return   SplashScreen();
      },
    ), 
    GoRoute(
      path: RoutesConstants.signUpScreen,
      builder: (BuildContext context, GoRouterState state) {
        return  SignUpScreen();
      },
    ),
    
    GoRoute(
      path: RoutesConstants.loginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },
    ),
    
    GoRoute(
      path: RoutesConstants.signscreen,
      builder: (BuildContext context, GoRouterState state) {
        return  SignScreen();
      },
    ),/*

    GoRoute(
      path: RoutesConstants.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ), 
    GoRoute(
      path: RoutesConstants.settingsScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsScreen();
      },
    ), /*
    GoRoute(
        path: RoutesConstants.bookingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const BookingScreen();
        }),
    GoRoute(
        path: RoutesConstants.favoriteScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const FavouritesScreen();
        }),*/
    GoRoute(
        path: RoutesConstants.addCar,
        builder: (BuildContext context, GoRouterState state) {
          return const AddCarScreen();
        }), 
    GoRoute(
        path: RoutesConstants.profileScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        })
  ],
  errorBuilder: (BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  }/ */
  ]

  
);
}

  


