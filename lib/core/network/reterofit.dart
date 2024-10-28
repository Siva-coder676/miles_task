import 'package:dio/dio.dart';
import 'package:miles_task/core/models/home_page_response.dart';
import 'package:miles_task/core/models/testmonial_response.dart';
import 'package:retrofit/retrofit.dart';
part 'reterofit.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(
      "/f/f/b56850fc-47bd-492c-a3da-2e8a8c5ddd0b/cfa60c8b-5c47-415e-a8a8-457eed3190ff/home_page.json?table=block&id=11f3d626-2aa2-806c-8c0e-debca77c7929&spaceId=b56850fc-47bd-492c-a3da-2e8a8c5ddd0b&expirationTimestamp=1730131200000&signature=2mPsSibnDwy_FT9jDCKKGfN9Nwa49fPUYvT7F35vxtk&downloadName=home_page.json")
  Future<HomePageResponse> getHomePageResponse();
  @GET("/f/f/b56850fc-47bd-492c-a3da-2e8a8c5ddd0b/846b7db1-ffc4-4fb8-be96-879d160f228b/testimonials.json?table=block&id=11f3d626-2aa2-80f5-90b2-fb2a5cb3cda8&spaceId=b56850fc-47bd-492c-a3da-2e8a8c5ddd0b&expirationTimestamp=1730174400000&signature=AHTtb939MuELwEtUy6wB8RVy2ZlQtC0BhlJqNfP-WDs&downloadName=testimonials.json")
  Future<TestmonialResponse> getTestmonialResponse();
}
