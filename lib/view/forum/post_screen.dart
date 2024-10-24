import 'package:agri_genesis/constant/color.dart';
import 'package:agri_genesis/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/string.dart';
import '../../widget/audio_player.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  // Sample data for dynamic list
  List<Post> posts = [
    Post(
      name: "Harikrishnan Lingasan",
      location: "Mannarkudi, Thiruvarur",
      time: "24 Jun 2024 9:41 am",
      postContent:
          "Hello! I'm having an issue to Export my Wheat out of India. How can I grow faster and export quality?",
      profileImage: "assets/images/farmer.png",
      postImage: "assets/images/farm.jpg",
      tags: ["Rain", "Weather", "Problem"],
      audioUrl: null
    ),
    Post(
      name: "Marimuthu Kumar",
      location: "Keelalur, Nagapattinum",
      time: "24 Jun 2024 10:41 am",
      postContent:
          "I\'m at my wit's end here, folks! I've been farming this land for years, but this season has been a real challenge. I've been watering my crops regularly, making sure the soil is moist but not waterlogged, and providing them with the necessary nutrients. But despite my best efforts, they're still wilting and turning yellow. I've checked for pests and diseases, but can't seem to find any signs of infestation. Has anyone else experienced this issue? Could it be related to the unusual weather patterns we\'ve been having? Or is there something else I\'m missing? I\'d love to hear from other farmers who may have some insight or advice. Help me #farmerproblems #croptrouble #wiltingcrops",
      profileImage: "assets/images/profile.png",
      postImage: null,
      tags: ["Rain", "Weather", "Problem"],
      audioUrl: "https://dl.prokerala.com/downloads/ringtones/files/mp3/pika-pikachu-14757.mp3"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return buildPost(post);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15,
            );
          },
        ),
      ),
    );
  }

  buildPost(Post post) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: secondaryColor,
                backgroundImage: AssetImage(post.profileImage ?? ""),
                radius: 25,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: post.name ?? "",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.black,
                  ),
                  CustomTextWidget(
                    text: post.location ?? "",
                    fontSize: 11,
                    fontColor: Colors.black,
                  ),
                  CustomTextWidget(
                    text: post.time ?? "",
                    fontSize: 9,
                    fontColor: Colors.black,
                  )
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert)
            ],
          ),
          const SizedBox(height: 10),
          // Display tags (like Rain, Weather, Problem)
          Wrap(
            spacing: 8.0,
            children: post.tags!
                .map((tag) => Chip(
                      side: BorderSide.none,
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      label: CustomTextWidget(text:tag, fontSize: 10, fontWeight: FontWeight.w600,),
                    ))
                .toList(),
          ),
          const SizedBox(height: 10),
          (post.postImage) == null ? const SizedBox() : Column(
            children: [
              SizedBox(
                width: Get.width,
                  height: 200,
                  child: Image.asset(post.postImage!, fit: BoxFit.fill,)),
              const SizedBox(height: 10),
            ],
          ),
          (post.audioUrl) == null ? const SizedBox() : Column(
            children: [
              SizedBox(
                  width: Get.width,
                  child:  AudioPlayerWidget(audioUrl: post.audioUrl!),),
              const SizedBox(height: 10),
            ],
          ),
          // Post content text
          CustomTextWidget(text: post.postContent ?? "", fontSize: 14,fontColor: Colors.black,),
          const SizedBox(height: 15),
          // Action buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/like.png"),
                    const SizedBox(width: 8,),
                    const CustomTextWidget(
                      text: like,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    )
                  ],
                ),
                onTap: () {},
              ),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/share.png"),
                    const SizedBox(width: 8,),
                    const CustomTextWidget(
                      text: share,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    )
                  ],
                ),
                onTap: () {},
              ),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/comment.png",),
                    const SizedBox(width: 8,),
                    const CustomTextWidget(
                      text: comment,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    )
                  ],
                ),
                onTap: () {},
              ),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/save.png"),
                    const SizedBox(width: 8,),
                    const CustomTextWidget(
                      text: save,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    )
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Data model for post
class Post {
  final String? name;
  final String? location;
  final String? time;
  final String? postContent;
  final String? profileImage;
  final String? postImage;
  final List<String>? tags;
  final String? audioUrl;

  Post({
    this.name,
    this.location,
    this.time,
    this.postContent,
    this.profileImage,
    this.tags,
    this.postImage,
    this.audioUrl
  });
}
