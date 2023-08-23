import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../res/components/flutter_toast.dart';
class StudentAuthViewModel {
  Future<void> handleStudentRegister({
    required String email,
    required String password,
  }) async {
    try {
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user != null){
        sharedPreferences.setBool('studentAuth', true);
        // Get.toNamed(NameRoutes.dashBoard);
        log('register successfull');
      }
    }  on FirebaseAuthException catch (e, r) {
      log('I am error:: $e');
      log('I am stack track error:: $r');
      if (e.code == 'weak-password') {
        toastInfo(msg: 'password is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'email is already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'invalid-email');
      }
    }
  }
  Future<void> handleStudentLogin({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        toastInfo(msg: 'No user found for that email.');
      }
      var user = credential.user;
      if (user != null) {
        toastInfo(msg: 'Login success');
        // Get.toNamed(NameRoutes.dashBoard);
        // Global.storageService.setString(AppConst.storageDeviceOpenFirstTime, '123456');
        // Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
      }else{
        toastInfo(msg: 'No user found for that email.');
      }
    }  on FirebaseAuthException catch (e, r) {
      log('I am error:: $e');
      log('I am stack track error:: $r');
      if (e.code == 'weak-password') {
        toastInfo(msg: 'password is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'email is already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'invalid-email');
      }
    }
  }
}
