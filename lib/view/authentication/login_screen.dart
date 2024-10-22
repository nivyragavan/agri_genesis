import 'package:agri_genesis/constant/color.dart';
import 'package:agri_genesis/view/authentication/register_screen.dart';
import 'package:agri_genesis/view/main/main_screen.dart';
import 'package:agri_genesis/widget/custom_elevated_button.dart';
import 'package:agri_genesis/widget/custom_text.dart';
import 'package:agri_genesis/widget/custom_text_button.dart';
import 'package:agri_genesis/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logo/logo.png", width: 200,),
              const SizedBox(
                height: 15,
              ),
              inputFields(),
              Center(
                child: CustomTextButtonWidget(
                    onPressed: () {
                      Get.to(const RegisterScreen());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          text: "Don’t have an account?",
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontColor: Colors.white,
                        ),
                        CustomTextWidget(
                          text: " Sign Up",
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontColor: Colors.black,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  inputFields(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CustomTextWidget(
              text: login,
              fontColor: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomTextWidget(
            text: email,
            fontColor: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormFieldWidget(
              controller: emailController, hintText: enterEmail),
          const SizedBox(
            height: 15,
          ),
          const CustomTextWidget(
            text: loginPassword,
            fontColor: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormFieldWidget(
            controller: passwordController,
            hintText: enterPassword,
            password: true,
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: CustomTextButtonWidget(
                onPressed: () {},
                child: const CustomTextWidget(
                  text: "Forgot Password ?",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontColor: Colors.white,
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: CustomElevatedButtonWidget(
                onPressed: () {
                  Get.to(const MainScreen());
                },
                fixedSize: const Size(230, 50),
                buttonColor: Colors.black,
                borderRadius: BorderRadius.circular(8),
                child: const CustomTextWidget(
                  text: login,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontColor: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
