import 'package:food_delivery_app/Views/AuthView.dart';
import 'package:food_delivery_app/Views/ChatView.dart';
import 'package:food_delivery_app/Views/MenuView.dart';
import 'package:food_delivery_app/Views/PizzaSlider.dart';

import 'package:food_delivery_app/Views/SetLocationView.dart';
import 'package:food_delivery_app/Views/SliderView.dart';
import 'package:food_delivery_app/Views/SplashView.dart';
import 'package:food_delivery_app/Views/dashboard.dart';
import 'package:food_delivery_app/Views/profileview.dart';
import 'package:get/get.dart';
// Assuming you have a login screen

class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => SplashView()),
    GetPage(name: '/Slider', page: () => SliderView()),
    GetPage(name: '/auth', page: () => AuthView()),
    GetPage(name: '/Map', page: () => SetLocationScreen()),
    GetPage(name: '/Chat', page: () => ChatScreen()),
    GetPage(name: '/Menu', page: () => MealMenuScreen()),
    GetPage(name: '/Landingpage', page: () => PizzaScreen()),
    GetPage(name: '/Dashboard', page: () => DashboardScreenView()),
    GetPage(name: '/Profile', page: () => ProfileScreen()),
  ];
}
