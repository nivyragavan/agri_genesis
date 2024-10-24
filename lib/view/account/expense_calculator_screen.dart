import 'package:agri_genesis/constant/string.dart';
import 'package:agri_genesis/widget/custom_text_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../../widget/custom_text.dart';

class ExpenseCalculatorScreen extends StatefulWidget {
  const ExpenseCalculatorScreen({super.key});

  @override
  State<ExpenseCalculatorScreen> createState() =>
      _ExpenseCalculatorScreenState();
}

class _ExpenseCalculatorScreenState extends State<ExpenseCalculatorScreen> {
  final List<double> values = [2000, 1000, 500, 100];
  final List<IconData> icons = [
    Icons.local_cafe,
    Icons.cloud,
    Icons.emoji_nature,
    Icons.fastfood
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const CustomTextWidget(
          text: expenseCalculator,
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildProfitGraph(),
              const SizedBox(
                height: 15,
              ),
              buildEstimatedProfit(),
              const SizedBox(
                height: 15,
              ),
              buildCalculator()
            ],
          ),
        ),
      ),
    );
  }

  buildProfitGraph() {
    double maxY = values.reduce((a, b) => a > b ? a : b);
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: profit,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontColor: Colors.black54,
              ),
              CustomTextWidget(
                text: "\u{20B9} 2,540",
                fontSize: 17,
                fontWeight: FontWeight.w800,
                fontColor: Colors.black,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          AspectRatio(
            aspectRatio: 1.5,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceEvenly,
                maxY: maxY,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        int index = value.toInt();
                        if (index < icons.length) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: CircleAvatar(
                                radius: 17, backgroundColor: secondaryColor),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        if (value % 50 == 0) {
                          return Text(
                            '₹ ${value.toInt()}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 11),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Colors.black38,
                      dashArray: [5, 5],
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    bottom: BorderSide(
                      color: Colors.black54,
                      width: 1,
                    ),
                  ),
                ),
                barGroups: List.generate(values.length, (index) {
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: values[index],
                        color: getBarColor(index).withOpacity(0.8),
                        width: 40,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildEstimatedProfit() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTextWidget(
                text: expectedProfit,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                fontColor: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.info_outline,
                color: Colors.black,
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextWidget(
            text: "\u{20B9} 2,540",
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontColor: primaryColor,
          ),
        ],
      ),
    );
  }

  buildCalculator() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: calculateProfit,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                fontColor: Colors.black,
              ),
              Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 20,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTextWidget(
                text: yourCrops,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontColor: Colors.black,
              ),
              CustomTextButtonWidget(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.add,
                        color: primaryColor,
                        size: 18,
                      ),
                      CustomTextWidget(
                        text: add,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontColor: primaryColor,
                      ),
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 17,
                  backgroundColor: secondaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                const CustomTextWidget(
                  text: "Coconut",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.black,
                ),
                const Spacer(),
                SizedBox(
                  width: Get.width * 0.20,
                  child: const CustomTextWidget(
                    text: "\u{20B9} 2,540",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontColor: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 17,
                  backgroundColor: secondaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                const CustomTextWidget(
                  text: "Mango",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.black,
                ),
                const Spacer(),
                SizedBox(
                  width: Get.width * 0.20,
                  child: const CustomTextWidget(
                    text: "\u{20B9} 1,670",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontColor: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 17,
                  backgroundColor: secondaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                const CustomTextWidget(
                  text: "Rubber",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.black,
                ),
                const Spacer(),
                SizedBox(
                  width: Get.width * 0.20,
                  child: const CustomTextWidget(
                    text: "\u{20B9} 790",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontColor: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getBarColor(int index) {
    switch (index) {
      case 0:
        return orangeColor;
      case 1:
        return blueColor;
      case 2:
        return yellowColor;
      case 3:
        return primaryColor;
      default:
        return Colors.grey;
    }
  }
}
