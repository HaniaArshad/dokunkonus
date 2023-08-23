import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../res/app_assets/app_assets.dart';
import '../res/app_strings/app_strings.dart';
import '../res/color/app_colors.dart';
import '../res/components/app_name_rich_text.dart';
import '../res/route/name_routes.dart';
import '../widgets/app_text.dart';
import '../widgets/custom_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offsetAnimation1;
  late Animation<Offset> offsetAnimation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    offsetAnimation1 = Tween<Offset>(
      begin: const Offset(0, -3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    offsetAnimation2 = Tween<Offset>(
      begin: const Offset(0, 3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SlideTransition(
              position: offsetAnimation1,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10.h,
                  left: 20.w,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: AppStrings.welcome,
                        fontSize: 26.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      const AppNameRichText(),
                      AppText(
                        title: AppStrings.informationOnDemand,
                        fontSize: 15.h,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset(
              AppAssets.logo,
              width: 320,
            ),
            SlideTransition(
              position: offsetAnimation2,
              child: CustomButton(
                color: const Color(0xff1C8274),
                onTap: () {
                  Get.toNamed(NameRoutes.login);
                },
                height: 50.h,
                width: 280.w,
                appText: AppText(
                  title: AppStrings.getStarted,
                  color: AppColors.kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
