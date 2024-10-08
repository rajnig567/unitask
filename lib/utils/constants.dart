import 'package:unitask/core.dart';

class Keys{
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
}

class AppColors{
  static Color redColor = const Color(0xFFFE6464);
  static Color bgColor = const Color(0xFFF1F7FB);
  static Color yellowColor = const Color(0xFFFEBB2E);
}

class APIConstants{
  static String baseURL = 'https://dummyjson.com/';
  static String products = 'products?limit=200';
}