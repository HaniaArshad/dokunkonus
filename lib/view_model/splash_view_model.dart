import 'package:flutter_application_1/res/route/name_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel extends GetxController {
  void splash() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getBool('studentAuth') == true) {
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          Get.offAndToNamed(NameRoutes.home);
        },
      );
    } else {
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          Get.offAndToNamed(NameRoutes.welcomeView);
        },
      );
    }
  }
}
