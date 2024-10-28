import 'package:logger/logger.dart';
import 'package:miles_task/core/controllers/home_page_controller.dart';
import 'package:miles_task/core/models/home_page_response.dart';
import 'package:miles_task/core/models/testmonial_response.dart';
import 'package:miles_task/core/network/network.dart';

class HomeService extends HomePageService {
  @override
  Future<HomePageResponse?>? getHomepageRespone() async {
    try {
      HomePageResponse homePageResponse =
          await MyApi().getClient().getHomePageResponse();
      return homePageResponse;
    } catch (e) {
      Logger().e(e.toString());
    }
    return null;
  }

  @override
  Future<TestmonialResponse?>? getTestmonialResponse() async {
    try {
      TestmonialResponse testmonialResponse =
          await MyApi().getClient().getTestmonialResponse();
      return testmonialResponse;
    } catch (e) {
      Logger().e(e.toString());
    }
    return null;
  }
}
