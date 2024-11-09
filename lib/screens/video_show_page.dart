import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miles_task/core/theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:lottie/lottie.dart';

class VideoShowpage extends StatefulWidget {
  final String? videoUrl;
  const VideoShowpage({this.videoUrl});

  @override
  _VideoShowpageState createState() => _VideoShowpageState();
}

class _VideoShowpageState extends State<VideoShowpage> {
  late YoutubePlayerController _controller;
  bool isPlaying = true;
  bool isFullScreen = false; // To manage full-screen state
  String currentTime = "0:00";

  @override
  void initState() {
    super.initState();
    String? videoId = widget.videoUrl == null ? null : YoutubePlayer.convertUrlToId(widget.videoUrl!);
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      )..addListener(() {
          if (_controller.value.isPlaying) {
            setState(() {
              isPlaying = true;
            });
          } else {
            setState(() {
              isPlaying = false;
            });
          }
        });

      _controller.addListener(() {
        if (_controller.value.isReady) {
          final currentPosition = _controller.value.position;
          setState(() {
            currentTime = "${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}";
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  void _toggleFullScreen() {
    setState(() {
      isFullScreen = !isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? videoId = widget.videoUrl == null ? null : YoutubePlayer.convertUrlToId(widget.videoUrl!);
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
      appBar: isFullScreen
          ? null // No app bar in full-screen mode
          : AppBar(
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
                "Youtube Video",
                style: TextStyle(
                    color: colorWhite, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
      body: Center(
        child: Container(
          width: isFullScreen ? double.infinity : 350,
          height: isFullScreen ? double.infinity : 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: colorWhite),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                onReady: () {
                  // Video player is ready
                },
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: PlayPauseOverlay(
                    isPlaying: isPlaying,
                    currentTime: currentTime,
                    onTogglePlayPause: _togglePlayPause,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  icon: Icon(
                    isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                    color: colorWhite,
                    size: 30,
                  ),
                  onPressed: _toggleFullScreen,
                ),
              ),
            ],
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
                "Thank you for showing interest in us",
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

class PlayPauseOverlay extends StatelessWidget {
  final bool isPlaying;
  final String currentTime;
  final VoidCallback onTogglePlayPause;

  const PlayPauseOverlay({
    required this.isPlaying,
    required this.currentTime,
    required this.onTogglePlayPause,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTogglePlayPause,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Play/Pause button
          Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: 50,
          ),
          SizedBox(height: 10),
          // Video time display
          Text(
            currentTime,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
