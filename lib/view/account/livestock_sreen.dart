import 'package:agri_genesis/constant/string.dart';
import 'package:agri_genesis/widget/custom_elevated_button.dart';
import 'package:agri_genesis/widget/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../../widget/custom_text.dart';

class LivestockScreen extends StatefulWidget {
  const LivestockScreen({super.key});

  @override
  State<LivestockScreen> createState() => _LivestockScreenState();
}

class _LivestockScreenState extends State<LivestockScreen> {
  bool isChecked = false;

  List<Map<String, dynamic>> animals = [
    {"name": "Buffalo", "image": Icons.pets, "count": 0},
    {"name": "Cow", "image": Icons.pets, "count": 0},
    {"name": "Goat", "image": Icons.pets, "count": 0},
    {"name": "OX", "image": Icons.pets, "count": 0},
    {"name": "Fisheries", "image": Icons.water, "count": 0},
    {"name": "Poultry", "image": Icons.egg, "count": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const CustomTextWidget(
            text: myLiveStock,
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
        body: Stack(
          children: [
            buildDetails(),
            Positioned(top: 80, left: 0, right: 0, child: buildHeading()),
            Positioned(top: 120, left: 0, right: 0, child: buildCount()),
            Positioned(bottom: 20, left: 20, right: 20, child: buildButton())
          ],
        ));
  }

  buildDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: liveStockDetails,
            fontColor: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          Row(
            children: [
              Transform.translate(
                offset: const Offset(-15, -5),
                child: Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ),
              Transform.translate(
                offset: const Offset(-20, -5),
                child: const CustomTextWidget(
                  text: noLivestock,
                  fontColor: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildHeading() {
    return Container(
      width: Get.width,
      height: 30,
      color: darkGreyColor,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: livestockName,
            fontColor: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          CustomTextWidget(
            text: count,
            fontColor: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  buildCount() {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.50,
          child: ListView.separated(
            itemCount: animals.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    // Animal Image
                    Icon(animals[index]['image'], size: 18),
                    const SizedBox(width: 10),

                    // Animal Name
                    Expanded(
                      child: Text(
                        animals[index]['name'],
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),

                    // Decrement Button
                    GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(4)),
                          child: const Icon(
                            Icons.remove,
                            size: 18,
                          )),
                      onTap: () {
                        setState(() {
                          if (animals[index]['count'] > 0) {
                            animals[index]['count']--;
                          }
                        });
                      },
                    ),

                    // Display Count
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          animals[index]['count'].toString(),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ),

                    // Increment Button
                    GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(4)),
                          child: const Icon(
                            Icons.add,
                            size: 18,
                          )),
                      onTap: () {
                        setState(() {
                          animals[index]['count']++;
                        });
                      },
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.black54,
                ),
              );
            },
          ),
        ),
        // Add More button
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomTextButtonWidget(
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: primaryColor,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomTextWidget(
                      text: addMore,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontColor: primaryColor,
                    ),
                  ],
                ))),
      ],
    );
  }

  buildButton() {
    return CustomElevatedButtonWidget(
        onPressed: () {},
        fixedSize: Size(Get.width * 0.80, 50),
        buttonColor: primaryColor,
        borderRadius: BorderRadius.circular(10),
        child: const CustomTextWidget(
          text: saveAndProceed,
          fontColor: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ));
  }
}
