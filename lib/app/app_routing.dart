import 'package:get/get.dart';

import '../pages/home/home_page.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: Routes.home, page: () => const HomePage()),
  ];
}

class Routes {
  Routes._();
  static const String home = '/';
}
