import 'package:agri_genesis/constant/string.dart';
import 'package:agri_genesis/view/forum/community_screen.dart';
import 'package:agri_genesis/view/forum/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color.dart';
import '../../../widget/custom_text.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final List<Widget> screens = [const PostScreen(), const CommunityScreen()];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: screens.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          toolbarHeight: 120,
          title: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: feed,
                    fontColor: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.80,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 8.0, bottom: 12.0),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: primaryColor,
                          ),
                          suffixIcon: const Icon(
                            Icons.keyboard_voice,
                            color: primaryColor,
                          ),
                          hintText: search,
                          hintStyle: const TextStyle(color: primaryColor)),
                    ),
                  ),
                  Image.asset("assets/icons/filter.png")
                ],
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ]),
              child: TabBar(
                  automaticIndicatorColorAdjustment: false,
                  labelColor: primaryColor,
                  unselectedLabelColor: primaryColor,
                  indicatorColor: Colors.green,
                  padding: const EdgeInsets.only(bottom: 10),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 50),
                  labelStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                  onTap: (int index) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  tabs: const [
                    Tab(
                      text: post,
                    ),
                    Tab(
                      text: community,
                    )
                  ]),
            ),
          ),
        ),
        body: screens[activeIndex],
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
