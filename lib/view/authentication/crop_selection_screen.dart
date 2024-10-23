import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/string.dart';
import '../../widget/custom_text.dart';

class CropSelectionScreen extends StatefulWidget {
  const CropSelectionScreen({super.key});

  @override
  State<CropSelectionScreen> createState() => _CropSelectionScreenState();
}

class _CropSelectionScreenState extends State<CropSelectionScreen> {
  // List of crops (crop name and icon)
  final List<Map<String, dynamic>> crops = [
    {'name': 'Coconut', 'icon': Icons.eco},
    {'name': 'Cardamom', 'icon': Icons.spa},
    {'name': 'Sugarcane', 'icon': Icons.local_drink},
    {'name': 'Tapioca', 'icon': Icons.grass},
    {'name': 'Banana', 'icon': Icons.local_florist},
    {'name': 'Black pepper', 'icon': Icons.grain},
    {'name': 'Mango', 'icon': Icons.emoji_nature},
    {'name': 'Paddy', 'icon': Icons.rice_bowl},
    {'name': 'Turmeric', 'icon': Icons.restaurant},
    {'name': 'Tea', 'icon': Icons.local_cafe},
    {'name': 'Cotton', 'icon': Icons.account_balance_wallet},
    {'name': 'Rubber', 'icon': Icons.fireplace},
    {'name': 'Betel nut', 'icon': Icons.nature_people},
  ];

  // List to store selected crops
  List<Map<String, dynamic>> selectedCrops = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 80,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const CustomTextWidget(
          text: selectCrops,
          fontColor: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Column(
        children: [
          if (selectedCrops.isNotEmpty)
            Container(
              height: 120,
              color: secondaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: selectedCrops
                    .map((crop) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(crop['icon'], size: 30),
                      ),
                      Positioned(
                        top: 15,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCrops.remove(crop);
                            });
                          },
                          child: const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.black,
                            child: Icon(Icons.close, size: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
                    .toList(),
              ),
            ),

          // Grid of crop options
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 16,
              ),
              itemCount: crops.length + 1, // Plus 1 for the "Add" button
              itemBuilder: (context, index) {
                if (index < crops.length) {
                  // Display existing crop items
                  final crop = crops[index];
                  return GestureDetector(
                    onTap: () {
                      if (!selectedCrops.contains(crop)) {
                        setState(() {
                          selectedCrops.add(crop);
                        });
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: secondaryColor,
                          child: Icon(crop['icon'], size: 30),
                        ),
                        const SizedBox(height: 5),
                        CustomTextWidget(text: crop['name'], fontWeight: FontWeight.w600,fontSize: 16,),
                      ],
                    ),
                  );
                } else {
                  // Display "Add new crop" button at the end
                  return GestureDetector(
                    onTap: () {
                    },
                    child:  const Icon(Icons.add, size: 30),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
