import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/app_assets/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../res/color/app_colors.dart';
import 'app_text.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final bool showIcon;
  final String imagePath;
  final Function() onTap;
  final AppText appText;

  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    this.color = AppColors.appThemeColor,
    required this.appText,
    required this.onTap,
    this.showIcon = false,
    this.imagePath = AppAssets.camera,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: (showIcon)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    imagePath,
                    width: 35,
                    height: 35,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: appText,
                  ),
                ],
              )
            : appText,
      ),
    );
  }
}
