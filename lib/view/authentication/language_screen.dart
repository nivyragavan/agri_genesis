import 'package:agri_genesis/constant/color.dart';
import 'package:agri_genesis/constant/string.dart';
import 'package:agri_genesis/view/main/main_screen.dart';
import 'package:agri_genesis/widget/custom_elevated_button.dart';
import 'package:agri_genesis/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final List<String> languages = [
    'English',
    'தமிழ்',
    'తెలుగు',
    'മലയാളം',
    'ಕನ್ನಡ'
  ];
  String selectedLanguage = 'English';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: const CustomTextWidget(
          text: appName,
          fontColor: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("assets/logo/logo.png"),
            ),
          )
        ],
      ),
      body: Container(
        width: Get.width,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            const CustomTextWidget(
              text: "Select your preferred language",
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontColor: Colors.black,
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 3.4,
                ),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  String language = languages[index];
                  bool isSelected = selectedLanguage == language;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLanguage = language;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? oliveColor : secondaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            language,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          if (isSelected)
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.check_circle_outline,
                                  color: Colors.black),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Divider(
                  color: Colors.black54,
                )),
            Positioned(
              bottom: 60,
              left: -13,
              right: 0,
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                          TextSpan(text: 'I agree to '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(color: primaryColor),
                          ),
                          TextSpan(text: ' & '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: CustomElevatedButtonWidget(
                    onPressed: () {
                      Get.to(const MainScreen());
                    },
                    fixedSize: const Size(375, 50),
                    buttonColor: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    child: const CustomTextWidget(
                      text: "Submit",
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    )))
          ],
        ),
      ),
    );
  }
}
