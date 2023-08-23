import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/color/app_colors.dart';
import 'package:flutter_application_1/res/route/name_routes.dart';
import 'package:flutter_application_1/view_model/student_auth_view_model.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import '../../res/app_assets/app_assets.dart';
import '../../res/app_strings/app_strings.dart';

class StudentAuth extends StatefulWidget {
  const StudentAuth({super.key});

  @override
  State<StudentAuth> createState() => _StudentAuthState();
}

class _StudentAuthState extends State<StudentAuth> {
  final inputBorder = const BorderRadius.vertical(
    bottom: Radius.circular(10.0),
    top: Radius.circular(20.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: FlutterLogin(
        title: AppStrings.dokunkonus,
        logo: const AssetImage('assets/launcher.png'),
        onLogin: (login) {
          StudentAuthViewModel().handleStudentLogin(
            email: login.name,
            password: login.password,
          );
          return null;
        },
        onSignup: (signUp) {
          StudentAuthViewModel().handleStudentRegister(
            email: '${signUp.name}',
            password: '${signUp.password}',
          );
          return null;
        },
        onSubmitAnimationCompleted: () {
          Get.offAndToNamed(NameRoutes.home);
          // Navigator.pop(context);
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //   builder: (context) => DashboardScreen(),
          // ));
        },
        onRecoverPassword: (p0) {},
        theme: LoginTheme(
          primaryColor: Colors.teal,
          accentColor: Colors.yellow,
          errorColor: Colors.deepOrange,
          titleStyle: const TextStyle(
            color: Colors.amber,
            fontFamily: 'Quicksand',
            letterSpacing: 1,
          ),
          bodyStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
          textFieldStyle: const TextStyle(
            color: Colors.orange,
            shadows: [
              Shadow(color: Colors.yellow, blurRadius: 2),
            ],
          ),
          buttonStyle: const TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.yellow,
          ),
          cardTheme: CardTheme(
            color: Colors.yellow.shade100,
            elevation: 5,
            margin: const EdgeInsets.only(top: 15),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(100.0)),
          ),
          inputTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.purple.withOpacity(.1),
            contentPadding: EdgeInsets.zero,
            errorStyle: const TextStyle(
              backgroundColor: Colors.orange,
              color: Colors.white,
            ),
            labelStyle: const TextStyle(fontSize: 12),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
              borderRadius: inputBorder,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
              borderRadius: inputBorder,
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade700, width: 7),
              borderRadius: inputBorder,
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade400, width: 8),
              borderRadius: inputBorder,
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 5),
              borderRadius: inputBorder,
            ),
          ),
          buttonTheme: LoginButtonTheme(
            splashColor: Colors.purple,
            backgroundColor: AppColors.backGroundColor,
            highlightColor: Colors.lightGreen,
            elevation: 9.0,
            highlightElevation: 6.0,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            // shape: CircleBorder(side: BorderSide(color: Colors.green)),
            // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
          ),
        ),
      ),
    );
  }
}
