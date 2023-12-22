import 'package:flutter/material.dart';
import 'package:flutter_piton/product/entities/category.dart';
import 'package:flutter_piton/view/details/category.dart';
import 'package:flutter_piton/view/register/register.dart';
import 'package:flutter_piton/view/error.dart';
import 'package:flutter_piton/view/home/home.dart';
import 'package:flutter_piton/view/login/login.dart';
import 'package:flutter_piton/view/splash/splash.dart';
import 'package:go_router/go_router.dart';

class RouterManager {
  RouterManager._();
  static const root = '/';
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const categoryDetails = '/categoryDetails';

  static Widget _splashRoute(BuildContext context, GoRouterState state) => const SplashScreen();
  static Widget _homeRoute(BuildContext context, GoRouterState state) => const HomeScreen();
  static Widget _loginRoute(BuildContext context, GoRouterState state) => const LoginScreen();
  static Widget _registerRoute(BuildContext context, GoRouterState state) => const RegisterScreen();

  static Widget _categoryDetailsRoute(BuildContext context, GoRouterState state) {
    var extra = state.extra as Category;
    return CategoryDetailsScreen(category: extra);
  }

  static Widget _errorRoute(BuildContext context, GoRouterState state) => const ErrorScreen();

  final GoRouter _router = GoRouter(
    errorBuilder: _errorRoute,
    routes: <RouteBase>[
      GoRoute(path: root, builder: _homeRoute),
      GoRoute(path: home, builder: _homeRoute),
      GoRoute(path: login, builder: _loginRoute),
      GoRoute(path: register, builder: _registerRoute),
      GoRoute(path: categoryDetails, builder: _categoryDetailsRoute),
    ],
  );
  static final RouterManager _instance = RouterManager._();
  static RouterManager get instance => _instance;
  GoRouter get router => _router;
}
