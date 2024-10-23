import 'package:agri_genesis/view/authentication/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../../constant/string.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text.dart';


class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

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
              text: "Enter your mobile number",
              fontColor: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                text: "We will send you",
                fontWeight: FontWeight.w300,
                fontSize: 15,
                fontColor: Colors.white,
              ),
              CustomTextWidget(
                text: " 4 digit",
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontColor: Colors.white,
              ),
              CustomTextWidget(
                text: " verification code",
                fontWeight: FontWeight.w300,
                fontSize: 15,
                fontColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Center(
            child: Container(
              width: 280,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white
              ),
              child: Row(
                children: [
                  const CustomTextWidget(
                    text: "+91",
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    fontColor: Colors.black54,
                  ),
                  const SizedBox(width: 5,),
                  Container(
                    width: 1,
                    height: 25,
                    color: Colors.black54,
                  ),
                  Expanded(child: TextFormField(
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8.0, bottom: 12.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)
                      ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                        ),
                    ),
                  ))
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: CustomElevatedButtonWidget(
                onPressed: () {
                  Get.to(const RegisterScreen());
                },
                fixedSize: const Size(230, 50),
                buttonColor: Colors.black,
                borderRadius: BorderRadius.circular(8),
                child: const CustomTextWidget(
                  text: signup,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontColor: Colors.white,
                )),
          ),
           const SizedBox(height: 20,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width:Get.width * 0.20, height:1, color: Colors.white,),
              const CustomTextWidget(
                text: "Or continue with",
                fontWeight: FontWeight.w300,
                fontSize: 12,
                fontColor: Colors.white,
              ),
              Container(width:Get.width * 0.20, height:1, color: Colors.white,),
            ],
          ),
          const SizedBox(height: 15,),
          Center(
            child: CustomElevatedButtonWidget(
                onPressed: () {
                  Get.to(const RegisterScreen());
                },
                fixedSize: const Size(280, 40),
                buttonColor: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/google.png"),
                    const SizedBox(width: 5,),
                    const CustomTextWidget(
                      text: "Google",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontColor: Colors.black,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
