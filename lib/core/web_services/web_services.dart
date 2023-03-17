import 'package:dio/dio.dart';
import 'package:pip/features/home/data/models/ad_model.dart';
import 'package:pip/features/menu/data/models/update_skill.dart';
import 'package:pip/features/pip/data/models/skills_model.dart';

import 'package:retrofit/retrofit.dart';

import '../../features/auth/data/models/auth_model.dart';
import '../../features/home/data/models/slider_model.dart';
import '../../features/menu/data/models/add_balance.dart';
import '../../features/menu/data/models/wallet_info.dart';
import '../../features/notification/data/models/notification_model.dart';


part 'web_services.g.dart';

@RestApi(baseUrl: '')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("user/notifications")
  Future<List<NotifiticationModel>> getAllNotifications(
      @Header('Authorization') String token);

  @GET("sliders")
  Future<List<SliderModel>> getAllSliders(
      @Header('Authorization') String token);

  @POST("user/authentication")
  Future<AuthModel> login(
    @Field("token")String token,
  );

  //register
  @POST("user/signup")
  Future<AuthModel> register(
    @Field("token") String? token,
    @Field("name") String? name,
    @Field("email") String? email,
    @Field("phone") String? phone,
    @Field("image_url") String? imageUrl,
  );


   @GET("skills")
  Future<List<SkillModel>> getAllSkills(
      @Header('Authorization') String token,
  );

  @GET("user/skills")
  Future<List<SkillModel>> getAllUserSkills(
      @Header('Authorization') String token,
  );
    @POST("user/skills/update")
  Future<UpdateSkill> updateSkill(@Header('Authorization') String token, @Body() List<int> skills);

      @GET("ads/search")
  Future<List<Ads>> getSearchResults(
    @Header('Authorization') String token,
  @Query("keyword") String keyword);


        @GET("user/wallet")
  Future<WalletInfo> getWalletInfo(@Header('Authorization') String token);

   @GET("ads")
  Future<List<AdModel>> getAllAds(@Header('Authorization') String token);

  //         @GET("deals/top?geography=international")
  // Future<List<DealModel> >getInternationalTopDeals(@Header('Authorization') String token);

  //         @GET("deals/top?geography=locale")
  // Future<List<DealModel> >getLocalTopDeals(@Header('Authorization') String token);

  @POST("user/wallet/balance/add")
  Future<AddBalance> addBalanceToWallet(
    @Header('Authorization') String token,
    @Field("amount") amount,
  );
//getAllArticles
//    @GET("articles")
//   Future<Article> getAllArticles(@Header('Authorization') String token);
// //-----------------------------------------------------------------------
// //get All STaff Data
//      @GET("staff")
//   Future<Doctor> getAllDoctors();

//   //auth with google
//   @POST("auth/google")
//   Future<SocialAuth> googleAuth(
//     @Field("id") id,
//     @Field("email") email,
//     @Field("firstName") firstName,
//     @Field("lastName") lastName,
//     @Field('picture') picture,
//   );

//   //register
//   @POST("auth/signup")
//   Future<AuthModel> register(
//     @Field("firstName") firstName,
//     @Field("lastName") lastName,
//     @Field("email") email,
//     @Field("password") password,
//   );

//   //get planets producs
//   @GET("products")
//   Future<ProductModel> fetchProducts(@Header('Authorization') String token);
// //get all tools
//    @GET("tools")
//   Future<ToolModel> fetchTools(@Header('Authorization') String token);
//   //get all plants
//     @GET("plants")
//   Future<PlantsModel> fetchPlants(@Header('Authorization') String token);
//   //get all seeds
//     @GET("seeds")
//   Future<SeedsModel> fetchSeeds(@Header('Authorization') String token);

//   //get all forums
//    @GET("forums")
//   Future<ForumsModel> fetchForums(@Header('Authorization') String token);
}
