import 'dart:async';

import 'package:flutter/material.dart';
import 'package:miles_task/core/theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:lottie/lottie.dart';

class VideoShowpage extends StatelessWidget {
  final String? videoUrl;
  const VideoShowpage({this.videoUrl});

  @override
  Widget build(BuildContext context) {
    String? videoId =
        videoUrl == null ? null : YoutubePlayer.convertUrlToId(videoUrl!);
    if (videoId == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Video Player"),
        ),
        body: Center(child: Text("Invalid video URL")),
      );
    }
    return Scaffold(
      backgroundColor: colorBlack,
      appBar: AppBar(
        backgroundColor: colorBlack,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              _showCustomBottomSheet(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: colorWhite,
            )),
        centerTitle: true,
        title: Text(
          "Yotube Video",
          style: TextStyle(
              color: colorWhite, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: colorWhite),
            borderRadius: BorderRadius.circular(8),
          ),
          child: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId!,
              flags: YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
              ),
            ),
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            onReady: () {
              // Video player is ready
            },
          ),
        ),
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: colorBlack, borderRadius: BorderRadius.circular(8)),

          width: double.maxFinite,
          height: 300, // Set height of the bottom sheet
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lottie Animation
              Lottie.asset(
                'assets/poppers.json', // Add your Lottie animation JSON file here
                width: 100, // Width of the animation
                height: 100, // Height of the animation
                fit: BoxFit.cover, // Fit mode
              ),
              SizedBox(height: 20), // Space between animation and text
              Text(
                "Thank for you showing interest in us",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: colorWhite),
              ),
              Text(
                "Our SPOC team will be connecting with you\n shortly on your provided contact details",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: colorWhite),
              ),
              SizedBox(height: 20), // Space below text
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Text("Close"),
              ),
            ],
          ),
        );
      },
    );
  }
}
