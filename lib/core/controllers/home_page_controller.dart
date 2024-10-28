import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:miles_task/core/models/home_page_response.dart';
import 'package:miles_task/core/models/testmonial_response.dart';
import 'package:miles_task/core/service/home_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class HomePageService {
  Future<HomePageResponse?>? getHomepageRespone();
  Future<TestmonialResponse?>? getTestmonialResponse();
}

class HomePageController extends ChangeNotifier {
  HomeService homeService;
  HomePageController({required this.homeService});

  List<Files> fileList = [];
  List<DataResponse?>? profileList = [];
  int _currentIndex = 0;

  //YoutubePlayerController get controller => _controller;
  int get currentIndex => _currentIndex;
  //String
  List<Posts> homeList = [];
  late bool isLoading;

  fetchData() {
    Logger().w("method is triggered");
    isLoading = true;
    homeList.clear();
    fileList.clear();
    profileList!.clear();
    getHomePageResponse();
    getTestmonialResponse();
    isLoading = false;
    notifyListeners();
  }

  getHomePageResponse() async {
    try {
      fileList.clear();
      homeList.clear();
      HomePageResponse? homePageResponse =
          await homeService.getHomepageRespone();
      for (int i = 0; i < homePageResponse!.data!.length; i++) {
        var response = homePageResponse.data![i];
        for (int j = 0; j < response.posts!.length; j++) {
          var posts = response.posts![j];
          homeList.add(posts);
        }
      }
      fileList = homePageResponse!.data!
          .expand((data) => data.posts ?? [])
          .expand((post) => post.files ?? [])
          .cast<Files>() // Cast to List<Files>
          .toList();
      notifyListeners();
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  getTestmonialResponse() async {
    TestmonialResponse? testmonialResponse =
        await homeService.getTestmonialResponse();
    for (int i = 0; i < testmonialResponse!.data!.length; i++) {
      profileList!.add(testmonialResponse.data![i]);
    }
    // Logger().w("fuc:${testmonialResponse!.data!.first.toJson()}");
    notifyListeners();
  }

  final List<String> imageList = [
    'assets/program.png',
    'assets/program.png',
    'assets/program.png',
    'assets/program.png',
    'assets/program.png',
  ];

  List<StoryItem>? storyItemList = [
    StoryItem(
      imagePath: 'assets/story_image1.jpg',
      name: 'Shamantha K.',
    ),
    StoryItem(
      imagePath: 'assets/story_image2.png',
      name: 'Shivam Chopra',
    ),
    StoryItem(
      imagePath: 'assets/story_image3.png',
      name: 'Neha Agarwal',
    ),
    StoryItem(
      imagePath: 'assets/story_image4.png',
      name: 'Kruti Singh',
    ),
    StoryItem(
      imagePath: 'assets/story_image4.png',
      name: 'Kruti Singh',
    ),
     StoryItem(
      imagePath: 'assets/story_image4.png',
      name: 'Kruti Singh',
    ),
     StoryItem(
      imagePath: 'assets/story_image4.png',
      name: 'Kruti Singh',
    ),
     StoryItem(
      imagePath: 'assets/story_image4.png',
      name: 'Kruti Singh',
    ),
    StoryItem(
      imagePath: 'assets/story_image3.png',
      name: 'Neha Agarwal',
    ),
  ];
  // void playVideo(int index) {
  //   _currentIndex = index;
  //   _controller.load(fileList[_currentIndex].id!);

  //   notifyListeners();
  // }
}

class StoryItem {
  final String? imagePath;
  final String? name;
  StoryItem({this.imagePath, this.name});
}
