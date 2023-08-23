import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/app_strings/app_strings.dart';
import 'package:flutter_application_1/res/color/app_colors.dart';
import 'package:flutter_application_1/res/route/name_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/app_text.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backGroundColor,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(NameRoutes.createCardView);
              },
              child: Container(
                width: 70.w,
                height: 80.h,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          color: AppColors.backGroundColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.sp),
                      child: const AppText(title: 'Create'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
