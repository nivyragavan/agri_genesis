import 'package:agri_genesis/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color.dart';
import '../../../widget/custom_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const CustomTextWidget(
          text: myAccount,
          fontColor: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                    size: 30,
                  )))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildProfile(),
            const SizedBox(
              height: 15,
            ),
            buildCrops(),
            const SizedBox(
              height: 15,
            ),
            buildMachinery(),
            const SizedBox(
              height: 15,
            ),
            buildLiveStock(),
            const SizedBox(
              height: 15,
            ),
            buildExpenseCalculator()
          ],
        ),
      ),
    );
  }

  buildProfile() {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextWidget(
                text: "Your name here",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontColor: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: const CustomTextWidget(
                  text: completeProfile,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontColor: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  buildCrops() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: Get.width * 0.44,
              height: 100,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/icons/history.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomTextWidget(
                        text: cropHistory,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontColor: Colors.black,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: Get.width * 0.44,
              height: 100,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/icons/protection.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomTextWidget(
                        text: protectionTips,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontColor: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildMachinery() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: secondaryColor),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(
                  text: myMachinery,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.black,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    children: [
                      CustomTextWidget(
                        text: edit,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.black,
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.edit,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
           const SizedBox(height: 10,),
            Row(
              children: [
                const Icon(Icons.motorcycle),
                const SizedBox(
                  width: 10,
                ),
                const CustomTextWidget(
                  text: "Tractor",
                  fontSize: 14,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                Container(
                  width: 70,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white
                  ),
                  child: const Center( child: CustomTextWidget(text: "Owner", fontSize: 12, fontWeight: FontWeight.w500,)),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.arrow_forward_ios_rounded, size: 18,)
              ],
            ),
            const SizedBox(height: 10,),
            const Divider(color: Colors.black,),
            const SizedBox(height: 10,),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: const CustomTextWidget(
                  text: addYourMachinery,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontColor: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildLiveStock() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: secondaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                const CustomTextWidget(
                  text: myLiveStock,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.black,
                ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Image.asset("assets/images/cow.png"),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWidget(
                      text: noLiveStock,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: Get.width * 0.55,
                      child:const CustomTextWidget(
                        text: tapToAddLivestock,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10,),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: const CustomTextWidget(
                  text: addYourLiveStock,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontColor: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildExpenseCalculator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: secondaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              text: expenseCalculator,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontColor: Colors.black,
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Image.asset("assets/images/calculator.png"),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWidget(
                      text: trackExpense,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: Get.width * 0.55,
                      child:const CustomTextWidget(
                        text: expenseDescription,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontColor: Colors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10,),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: const CustomTextWidget(
                  text: calculateExpense,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontColor: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
