import 'package:flutter_application_1/view/card/card_view.dart';
import 'package:flutter_application_1/view/card/create_card_view.dart';
import 'package:flutter_application_1/view/home_view.dart';
import 'package:get/get.dart';
import '../../view/login/login_view.dart';
import '../../view/login/student_auth.dart';
import '../../view/splash_view.dart';
import '../../view/welcome_view.dart';
import 'name_routes.dart';

class AppRoutes{
  static appRoutes() => [
    GetPage(name: NameRoutes.splash, page: () => const SplashView()),
    GetPage(name: NameRoutes.welcomeView, page: () => const WelcomeView()),
    GetPage(name: NameRoutes.home, page: () => const HomeView()),
    GetPage(name: NameRoutes.login, page: () => const LoginView()),
    GetPage(name: NameRoutes.studentAuth, page: () => const StudentAuth()),
    GetPage(name: NameRoutes.cardView, page: () => const CardView()),
    GetPage(name: NameRoutes.createCardView, page: () => const CreateCardView()),
  ];
}
