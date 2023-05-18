import 'dart:io';

import 'package:dio/dio.dart';
import '../../features/chat/data/models/chat_with_user_model.dart';
import '../../features/chat/data/models/chats_messages_model.dart';
import '../../features/chat/data/models/job_chats_model.dart';
import '../../features/chat/data/models/show_chat_info_model.dart';
import '../../features/chat/data/models/unread_messages_count.dart';
import '../../features/home/data/models/ad_model.dart';
import '../../features/menu/data/models/setting_model.dart';
import '../../features/menu/data/models/update_skill.dart';
import '../../features/notification/data/models/unread_notification.dart';
import '../../features/pip/data/models/driver_model.dart';
import '../../features/pip/data/models/fast_request_category.dart';
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
import '../../features/pip/data/models/toggle_model.dart';
import '../../features/requests/data/models/available_fast_request_model.dart';
import '../../features/requests/data/models/create_fast_request_model.dart';
import '../../features/requests/data/models/fast_request_model.dart';
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
  @GET("deals/{id}/offers")
  Future<List<OfferModel>> getAllRequestOffers(
    @Header('Authorization') String token,
    @Path('id') int id,
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
  @GET("user/deals/fast")
  Future<List<FastRequestModel>> getFastRequests(
      @Header('Authorization') String token);
            //-----------------------new-----------------------------------------------------------------
  @GET("user/deals/fast/hirings")
  Future<List<AvailableFastRequestModel>> getAvailableFastRequests(
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
  @POST("deals/update")
  Future<UpdateSkill> updateRequest(
    @Header('Authorization') String token,
    @Field('id') String? id,
    @Field('category_id') String? categoryId,
    @Field('price') String? price,
    @Field('location') String? location,
    @Field('description') String? description,
  );

  //-----------------------new-----------------------------------------------------------------
  @POST("deals/delete")
  Future<UpdateSkill> deleteRequest(
    @Header('Authorization') String token,
    @Field('id') String? id,
   
  );


//-----------------------new-----------------------------------------------------------------
  @POST("deals/complete")
  Future<UpdateSkill> completeRequest(
    @Header('Authorization') String token,
    @Field('id') String? id,
   
  );



  //-----------------------new-----------------------------------------------------------------
  @POST("deals/offers/accept")
  Future<UpdateSkill> acceptOffer(
    @Header('Authorization') String token,
    @Field('offer_id') String? offerId,
  );
  //-----------------------new-----------------------------------------------------------------
  @POST("deals/fast/create")
  Future<CreateFastRequestModel> createFastRequest(
    @Header('Authorization') String token,
    @Field('category_id') String? categoryId,
    @Field('destination_from_lat') String? mettingPointLat,
    @Field('destination_from_long') String? mettingPointLong,
    @Field('destination_to_lat') String? destinationLat,
    @Field('destination_to_long') String? destinationLong,
   @Field('description')  String? description,


  );
  //-----------------------new-----------------------------------------------------------------
  @POST("user/deals/fast/hirings/accept")
  Future<UpdateSkill> acceptFastRequest(
    @Header('Authorization') String token,
    @Field('request_id') String? requestId,
  );


  //-----------------------new-----------------------------------------------------------------

   @POST("user/deals/fast/cancel")
  Future<UpdateSkill> cancelFastRequest(
    @Header('Authorization') String token,
    @Field('request_id') String? requestId,
  );
   @POST("user/deals/fast/complete")
  Future<UpdateSkill> completeFastRequest(
    @Header('Authorization') String token,
    @Field('request_id') String? requestId,
      @Field('price') String? price,
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
  @GET("user/notifications/unread")
  Future<UnreadNotificationCount> getUnreadNotificationCount(
      @Header('Authorization') String token);
            //-----------------------new-----------------------------------------------------------------
  @GET("chat/notifications")
  Future<UnreadMessagesCount > getUnreadMessagesCount(
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
  @GET("user/chats/requests/{chatId}/show")
  Future<JobChatsModel> getAllJobChats(
      @Header('Authorization') String token, @Path('chatId') int chatId);

        //-----------------------new-----------------------------------------------------------------
  @GET("deals/fast/{requestId}/show")
  Future<DriverModel> getDriverInfo(
      @Header('Authorization') String token, @Path('requestId') String requestId);

  //-----------------------new-----------------------------------------------------------------
  @GET("chat/{chatId}/show")
  Future<ShowChatInfoModel> getChatInfo(
      @Header('Authorization') String token, @Path('chatId') int chatId);
  //-----------------------new-----------------------------------------------------------------
  @GET("chat/{chatId}/messages")
  Future<List<ChatMessagesModel>>   getAllChatMessages(
      @Header('Authorization') String token, @Path('chatId') int chatId);

//-----------------------new-----------------------------------------------------------------
  @POST("support/tickets/create")
  Future<UpdateSkill> sendComplain(
    @Header('Authorization') String token,
    @Field("name") name,
    @Field("phone") phone,
    @Field("email") email,
    @Field("notes") notes,
  );

  //-----------------------new-----------------------------------------------------------------
  @POST("chat/messages/create")
  Future<UpdateSkill> sendMessage(
    @Header('Authorization') String token,
    @Field("chat_id") chatId,
    @Field("message") message,
  );
  

  @POST("chat/messages/create")
  @MultiPart()
  Future<UpdateSkill> sendAttachmnet(
     @Header('Authorization') String token,
    @Part(name:"chat_id") chatId,
    @Part(name:"message") message,
    @Part(name: 'attachment') File img,
   
  );

    //-----------------------new-----------------------------------------------------------------
  @POST("chat/report")
  Future<UpdateSkill> reportChat(
    @Header('Authorization') String token,
    @Field("chat_id") chatId,
    @Field("comment") comment,
  );
    //-----------------------new-----------------------------------------------------------------
  @POST("chat/start")
  Future<ChatWithUserModel>chatWithUser(
    @Header('Authorization') String token,
    @Field("request_id") requestId,
    @Field("target_id") targetId,
  );



      //-----------------------new-----------------------------------------------------------------
  @POST("user/fastrequests/toggle")
  Future<ToggleModel> toggleFastRequest(
    @Header('Authorization') String token,

  );
      //-----------------------new-----------------------------------------------------------------
  @GET("skills/fast")
  Future<List<FastRequestCategory>> getAllFastRequestCategories(
    @Header('Authorization') String token,

  );



}
