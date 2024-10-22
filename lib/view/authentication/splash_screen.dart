import 'package:agri_genesis/constant/color.dart';
import 'package:agri_genesis/view/authentication/login_screen.dart';
import 'package:agri_genesis/view/main/main_screen.dart';
import 'package:agri_genesis/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constant/string.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      checkNavigation();
    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/logo/logo.png"),
          const SizedBox(height: 50),
          const CustomTextWidget(
            text: appName,
            fontSize: 56,
            fontColor: Colors.white,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          )
        ],
      ),
    );
  }

  checkNavigation(){
    if(box.read("token") == null){
      Get.offAll(const LoginScreen());
    }else{
      Get.offAll(const MainScreen());
    }
  }
}
