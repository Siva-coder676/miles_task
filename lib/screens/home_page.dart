import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gif_view/gif_view.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:miles_task/core/controllers/home_page_controller.dart';
import 'package:miles_task/core/theme.dart';
import 'package:miles_task/custom_widgets/alumini_card_widget.dart';
import 'package:miles_task/custom_widgets/bottom_nav_bar.dart';
import 'package:miles_task/custom_widgets/circle_avatar_widget.dart';
import 'package:miles_task/custom_widgets/class_2024_widget.dart';
import 'package:miles_task/custom_widgets/crisis_card_widget.dart';
import 'package:miles_task/screens/video_show_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../custom_widgets/american_dream_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomePageController>().getHomePageResponse();
    context.read<HomePageController>().getTestmonialResponse();
    context.read<HomePageController>().isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          Container(height: 100, child: BottomNavigationComponent()),
      backgroundColor: colorBlack,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset("assets/bell.svg"),
          )
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: SvgPicture.asset("assets/miles_app_bar_logo.svg"),
        ),
        backgroundColor: colorBlack,
      ),
      body: Consumer(
        builder: (context, HomePageController controller, child) {
          return RefreshIndicator(
            onRefresh: () async {
              controller.fetchData(); // Your data fetching logic
            },
            child: controller.isLoading
                ? Center(
                    child: Lottie.asset('assets/loader.json'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Good Morning! \nShivam ",
                                style: TextStyle(
                                  color: colorWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Spacer(), // Pushes the next widget to the end of the row
                            Container(
                              width: 240,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () async {
                                    Logger().w("button is tapped");
                                    final phoneNumber =
                                        'tel:+1234567890'; // Replace with your desired phone number
                                    if (await canLaunch(phoneNumber)) {
                                      await launch(phoneNumber);
                                    } else {
                                      Logger().e("Could not launch dial pad");
                                    }
                                  },
                                  child: GifView.asset(
                                    'assets/call_button.gif',
                                    height: 100,
                                    frameRate: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        controller.profileList!.isEmpty
                            ? CircularProgressIndicator()
                            : SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.storyItemList!.length,
                                  itemBuilder: (context, index) {
                                    final storyItem =
                                        controller.storyItemList![index];
                                    final profileName =
                                        controller.profileList![index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: CircleAvatarWidget(
                                        assetPath: storyItem.imagePath!,
                                        name: profileName!.first_name! +
                                            profileName.last_name!,
                                      ),
                                    );
                                  },
                                ),
                              ),
                        Image.asset("assets/dreams_banner.png"),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "The Global Accountant",
                                style: TextStyle(
                                  fontFamily: 'SF UI Display',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: colorWhite,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Image.asset("assets/label_design.png"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child:
                                      AlumniCardWidget()), // Makes the widgets flexible
                              SizedBox(width: 20),
                              Expanded(child: CrisisCard()),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Expanded(child: Class2024Widget()),
                              SizedBox(width: 20),
                              Expanded(child: AmericanDreamCard()),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Image.asset("assets/setup.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Upcoming Events",
                                style: TextStyle(
                                  fontFamily: 'SF UI Display',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: colorWhite,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Image.asset("assets/label_design.png"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Image.asset("assets/banner.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Accounting Unplugged",
                                style: TextStyle(
                                  fontFamily: 'SF UI Display',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: colorWhite,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Image.asset("assets/label_design.png"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        controller.fileList.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : SizedBox(
                                height:
                                    300, // Set a fixed height for scrolling space
                                child: ListView.builder(
                                  itemCount: controller.fileList.length,
                                  itemBuilder: (context, index) {
                                    final post = controller.fileList[index];
                                    final homeResponse =
                                        controller.homeList[index];

                                    String? videoUrl = post.video_url;
                                    String? thumbnailUrl;

                                    if (videoUrl != null) {
                                      String? videoId =
                                          YoutubePlayer.convertUrlToId(
                                              videoUrl);
                                      if (videoId != null) {
                                        thumbnailUrl =
                                            YoutubePlayer.getThumbnail(
                                                videoId: videoId);
                                      }
                                    }

                                    return Container(
                                        width: 158,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        // margin: EdgeInsets.symmetric(
                                        //     vertical: 8, horizontal: 16),
                                        // padding: EdgeInsets.symmetric(
                                        //     vertical: 8, horizontal: 16),

                                        child: ListTile(
                                          onTap: () {
                                            Logger().d("tap");
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      VideoShowpage(
                                                    videoUrl: videoUrl,
                                                  ),
                                                ));
                                          },
                                          title: post.video_url != null
                                              ? Image.network(
                                                  thumbnailUrl!,
                                                  // fit: BoxFit.cover,
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        value: loadingProgress
                                                                    .expectedTotalBytes !=
                                                                null
                                                            ? loadingProgress
                                                                    .cumulativeBytesLoaded /
                                                                (loadingProgress
                                                                        .expectedTotalBytes ??
                                                                    1)
                                                            : null,
                                                      ),
                                                    );
                                                  },
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                    return Icon(
                                                      Icons.broken_image,
                                                      size: 50,
                                                      color: Colors.grey,
                                                    );
                                                  },
                                                )
                                              : null,
                                          subtitle: Row(
                                            children: [
                                              Image.asset(
                                                  "assets/miles_logo.png"),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Container(
                                                width: 300,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      homeResponse.title!,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: colorWhite,
                                                      ),
                                                    ),
                                                    Text(
                                                        homeResponse.likes
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0XFF606060)))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ));
                                  },
                                ),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Our Programs",
                                style: TextStyle(
                                  fontFamily: 'SF UI Display',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: colorWhite,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Image.asset("assets/label_design.png"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 400,
                            autoPlay: true,
                            enlargeCenterPage: true,
                          ),
                          items: controller.imageList
                              .map((item) =>
                                  Image.asset(item, fit: BoxFit.cover))
                              .toList(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Flagbearers for ',
                                      style: TextStyle(
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        color: Color(0xffddeeff),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Accountants!',
                                      style: TextStyle(
                                        fontFamily: 'Work Sans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 36,
                                        color: Color(0xffddeeff),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(left: 88),
                                child: Text(
                                  'Created with ♥️ at Miles Education',
                                  style: TextStyle(
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Color(0xffd5dbe2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
