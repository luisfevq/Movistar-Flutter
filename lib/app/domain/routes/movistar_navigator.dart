import 'package:fluvistar/app/domain/presentation/home/home_binding.dart';
import 'package:fluvistar/app/domain/presentation/home/home_screen.dart';
import 'package:fluvistar/app/domain/presentation/login/login_binding.dart';
import 'package:fluvistar/app/domain/presentation/login/login_screen.dart';
import 'package:fluvistar/app/domain/presentation/main_binding.dart';
import 'package:fluvistar/app/domain/presentation/splash/splash_binding.dart';
import 'package:fluvistar/app/domain/presentation/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

class MovistarRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
}

class MovistarPages {
  static final pages = [
    GetPage(
      name: MovistarRoutes.splash,
      page: () => SpashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: MovistarRoutes.login,
      page: () => LoginScreen(),
      bindings: [MainBinding(), LoginBinding()],
    ),
    GetPage(
      name: MovistarRoutes.home,
      page: () => HomeScreen(),
      bindings: [MainBinding(), HomeBinding()],
    ),
  ];
}
