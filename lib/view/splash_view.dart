import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/app_assets/app_assets.dart';
import 'package:flutter_application_1/view_model/splash_view_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/color/app_colors.dart';
import '../res/components/app_name_rich_text.dart';
import '../res/route/name_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel splashViewModel = SplashViewModel();

  @override
  void initState() {
    splashViewModel.splash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C8274),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.launcher),
            const AppNameRichText(),
          ],
        ),
      ),
    );
  }
}
