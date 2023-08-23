import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/app_assets/app_assets.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/app_strings/app_strings.dart';
import '../../res/color/app_colors.dart';
import '../../widgets/app_text.dart';

class CreateCardView extends StatefulWidget {
  const CreateCardView({super.key});

  @override
  State<CreateCardView> createState() => _CreateCardViewState();
}

class _CreateCardViewState extends State<CreateCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.backGroundColor,
        title: AppText(
          title: AppStrings.createCard,
          color: Colors.white,
          fontSize: 15.sp,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppText(
                title: '1. ${AppStrings.letSetUpACardPicture}',
                fontSize: 20.sp,
                color: AppColors.appTextColors,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Container(
                width: 160.w,
                height: 180.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.appTextColors,
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100.h,
                      width: 120.w,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomButton(
                  height: 55.h,
                  width: 280.w,
                  showIcon: true,
                  appText: const AppText(
                    title: 'Take a photo',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  height: 55.h,
                  imagePath: AppAssets.gallery,
                  showIcon: true,
                  width: 280.w,
                  appText: const AppText(
                    title: 'Choose a photo',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
