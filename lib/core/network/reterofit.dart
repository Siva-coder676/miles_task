import 'package:dio/dio.dart';
import 'package:miles_task/core/models/home_page_response.dart';
import 'package:miles_task/core/models/testmonial_response.dart';
import 'package:retrofit/retrofit.dart';
part 'reterofit.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(
      "/f/f/b56850fc-47bd-492c-a3da-2e8a8c5ddd0b/cfa60c8b-5c47-415e-a8a8-457eed3190ff/home_page.json?table=block&id=11f3d626-2aa2-806c-8c0e-debca77c7929&spaceId=b56850fc-47bd-492c-a3da-2e8a8c5ddd0b&expirationTimestamp=1731218400000&signature=EFuHejuxV_y74KcHYv0nWDE4mfm5XXh-j_iT53Xqve8&downloadName=home_page.json")
  Future<HomePageResponse> getHomePageResponse();
  @GET("/f/f/b56850fc-47bd-492c-a3da-2e8a8c5ddd0b/846b7db1-ffc4-4fb8-be96-879d160f228b/testimonials.json?table=block&id=11f3d626-2aa2-80f5-90b2-fb2a5cb3cda8&spaceId=b56850fc-47bd-492c-a3da-2e8a8c5ddd0b&expirationTimestamp=1731218400000&signature=X0u5QPjVLxA9Em4NlDK-j_Cp2wt7WTZPtM7mit1ulqM&downloadName=testimonials.json")
  Future<TestmonialResponse> getTestmonialResponse();
}
