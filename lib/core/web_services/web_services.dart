import 'dart:io';

import 'package:dio/dio.dart';
import '../../features/home/data/models/ad_model.dart';
import '../../features/menu/data/models/setting_model.dart';
import '../../features/menu/data/models/update_skill.dart';
import '../../features/pip/data/models/skills_model.dart';

import 'package:retrofit/retrofit.dart';

import '../../features/auth/data/models/auth_model.dart';
import '../../features/chat/data/models/hiring_chat_model.dart';
import '../../features/home/data/models/slider_model.dart';
import '../../features/menu/data/models/add_balance.dart';
import '../../features/menu/data/models/rates_model.dart';
import '../../features/menu/data/models/user_info_model.dart';
import '../../features/menu/data/models/wallet_info.dart';
import '../../features/notification/data/models/notification_model.dart';
import '../../features/requests/data/models/my_request_model.dart';
import '../../features/requests/data/models/offer_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: '')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("user/notifications")
  Future<List<NotifiticationModel>> getAllNotifications(
      @Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @GET("sliders")
  Future<List<SliderModel>> getAllSliders(
      @Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @POST("user/authentication")
  Future<AuthModel> login(
    @Field("token") String token,
  );
//-----------------------new-----------------------------------------------------------------
  @POST("user/signup")
  Future<AuthModel> register(
    @Field("token") String? token,
    @Field("name") String? name,
    @Field("email") String? email,
    @Field("phone") String? phone,
    @Field("image_url") String? imageUrl,
  );
//-----------------------new-----------------------------------------------------------------
  @GET("skills")
  Future<List<SkillModel>> getAllSkills(
    @Header('Authorization') String token,
  );
//-----------------------new-----------------------------------------------------------------
  @GET("user/skills")
  Future<List<SkillModel>> getAllUserSkills(
    @Header('Authorization') String token,
  );
//-----------------------new-----------------------------------------------------------------
  @POST("user/skills/update")
  Future<UpdateSkill> updateSkill(
      @Header('Authorization') String token, @Field('id') String skill);
//-----------------------new-----------------------------------------------------------------
  @GET("ads/search")
  Future<List<Ads>> getSearchResults(
      @Header('Authorization') String token, @Query("keyword") String keyword);
//-----------------------new-----------------------------------------------------------------
  @GET("user/wallet")
  Future<WalletInfo> getWalletInfo(@Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @GET("ads")
  Future<List<AdModel>> getAllAds(@Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @GET("user/deals")
  Future<List<MyRequestModel>> getAllMyRequests(
      @Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @GET("requests/hirings")
  Future<List<MyRequestModel>> getAllAvailableJobs(
      @Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @GET("user/offers")
  Future<List<OfferModel>> getAllOffers(@Header('Authorization') String token);

//-----------------------new-----------------------------------------------------------------
  @POST("user/wallet/balance/add")
  Future<AddBalance> addBalanceToWallet(
    @Header('Authorization') String token,
    @Field("amount") amount,
  );
//-----------------------new-----------------------------------------------------------------
  @POST("deals/create")
  @MultiPart()
  Future<UpdateSkill> createSpecialRequest(
    @Header('Authorization') String token,
    @Part(name: 'category_id') String? categoryId,
    @Part(name: 'price') String? price,
    @Part(name: 'location') String? location,
    @Part(name: 'description') String? description,
    @Part(name: 'images[]') List<File> img,
  );
  //-----------------------new-----------------------------------------------------------------
  @POST("offers/create")
  @MultiPart()
  Future<UpdateSkill> giveOffer(
    @Header('Authorization') String token,
    @Part(name: 'price') String? price,
    @Part(name: 'duration') String? duration,
    @Part(name: 'description') String? description,
    @Part(name: 'images[]') List<File> img,
    @Part(name: 'request_id') String? requestId,
  );
  //-----------------------new-----------------------------------------------------------------
  @POST("offers/create")
  @MultiPart()
  Future<UpdateSkill> giveOfferWithoutImages(
    @Header('Authorization') String token,
    @Part(name: 'price') String? price,
    @Part(name: 'duration') String? duration,
    @Part(name: 'description') String? description,
    // @Part(name: 'images[]') List<File> img,
    @Part(name: 'request_id') String? requestId,
  );
//-----------------------new-----------------------------------------------------------------
  @POST("deals/create")
  Future<UpdateSkill> createSpecialRequestWithoutImage(
    @Header('Authorization') String token,
    @Field('category_id') String? categoryId,
    @Field('price') String? price,
    @Field('location') String? location,
    @Field('description') String? description,
  );
  //-----------------------new-----------------------------------------------------------------
  @POST("deals/offers/accept")
  Future<UpdateSkill> acceptOffer(
    @Header('Authorization') String token,
    @Field('offer_id') String? offerId,
  );
//-----------------------new-----------------------------------------------------------------
  @GET("ratings")
  Future<RatesModel> getAllRates(@Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @POST("ratings/create")
  Future<UpdateSkill> sendRates(
    @Header('Authorization') String token,
    @Field("experience_stars") experienceStars,
    @Field("professionl_stars") proffesionalStars,
    @Field("communication_stars") communicationStars,
    @Field("quality_stars") qualityStars,
    @Field("time_stars") timeStars,
  );
//-----------------------new-----------------------------------------------------------------
  @GET("user/info")
  Future<UserInfoModel> getUserInfo(@Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @POST("user/update")
  @MultiPart()
  Future<UpdateSkill> updateProfile(
    @Part(name: 'name') String? name,
    @Part(name: 'email') String? email,
    @Part(name: 'phone') String? phone,
    @Part(name: 'image') File img,
    @Header('Authorization') String token,
  );
//-----------------------new-----------------------------------------------------------------
  @POST("user/update")
  @MultiPart()
  Future<UpdateSkill> updateProfileWithoutImage(
    @Part(name: 'name') String? name,
    @Part(name: 'email') String? email,
    @Part(name: 'phone') String? phone,
    // @Part(name: 'image') File img,
    @Header('Authorization') String token,
  );
//-----------------------new-----------------------------------------------------------------
  @GET("app/settings")
  Future<List<SettingModel>> getAllSettings(
      @Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @GET("user/chats/hirings")
  Future<List<HiringChatModel>> getAllHiringChats(
      @Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @GET("user/chats/requests")
  Future<List<HiringChatModel>> getAllRequestsChats(
      @Header('Authorization') String token);
//-----------------------new-----------------------------------------------------------------
  @POST("support/tickets/create")
  Future<UpdateSkill> sendComplain(
    @Header('Authorization') String token,
    @Field("name") name,
    @Field("phone") phone,
    @Field("email") email,
    @Field("notes") notes,
  );
}
