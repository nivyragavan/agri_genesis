import 'package:agri_genesis/constant/color.dart';
import 'package:agri_genesis/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: Get.width,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index){
            return Column(
              children: [
                buildListTile(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(color: Colors.black54,),
                )
              ],
            );
          })
        ),
      ),
    );
  }

  buildListTile() {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: secondaryColor,
        backgroundImage: AssetImage("assets/images/farmer.png"),
      ),
      title: const Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: CustomTextWidget(
          text: "Harikrishnan Lingasan",
          fontColor: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          textOverflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: const CustomTextWidget(
        text: "Please upload your profile picture",
        fontColor: Colors.black54,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        textOverflow: TextOverflow.ellipsis,
      ),
      trailing: SizedBox(
        width: Get.width * 0.15,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: "24/10/24",
              fontSize: 10,
              fontWeight: FontWeight.w700,
              fontColor: Colors.black54,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: primaryColor,
                  child: CustomTextWidget(
                    text: "3",
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    fontColor: Colors.white,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
