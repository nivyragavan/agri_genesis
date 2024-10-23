import 'package:agri_genesis/view/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../../constant/string.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_button.dart';
import '../../widget/custom_text_form_field.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static final nameController = TextEditingController();
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
                      Get.to(const LoginScreen());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          text: "You have an account?",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontColor: Colors.white,
                        ),
                        CustomTextWidget(
                          text: " Login",
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
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
              text: signup,
              fontColor: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomTextWidget(
            text: name,
            fontColor: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormFieldWidget(
              controller: nameController, hintText: enterName),
          const SizedBox(
            height: 15,
          ),
          const CustomTextWidget(
            text: email,
            fontColor: Colors.white,
            fontSize: 18,
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
            text: password,
            fontColor: Colors.white,
            fontSize: 18,
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
            height: 20,
          ),
          Center(
            child: CustomElevatedButtonWidget(
                onPressed: () {},
                fixedSize: const Size(230, 50),
                buttonColor: Colors.black,
                borderRadius: BorderRadius.circular(8),
                child: const CustomTextWidget(
                  text: signup,
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

