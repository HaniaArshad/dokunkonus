import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/app_assets/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../res/app_strings/app_strings.dart';
import '../../res/color/app_colors.dart';
import '../../res/components/app_name_rich_text.dart';
import '../../res/route/name_routes.dart';
import '../../widgets/app_text.dart';
import '../../widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appThemeColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
            // const AppNameRichText(),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomButton(
                height: 50.h,
                width: 250.w,
                color: Colors.white,
                appText: const AppText(
                  title: AppStrings.directerLogin,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomButton(
                height: 50.h,
                width: 250.w,
                color: Colors.white,
                appText: const AppText(
                  title: AppStrings.teacherLogin,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomButton(
                height: 50.h,
                width: 250.w,
                color: Colors.white,
                appText: const AppText(
                  title: AppStrings.studentLogin,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                onTap: () {
                  Get.toNamed(NameRoutes.studentAuth);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomButton(
                height: 50.h,
                width: 250.w,
                color: Colors.white,
                appText: const AppText(
                  title: AppStrings.familyLogin,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
