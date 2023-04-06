import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pip/features/chat/presentation/screens/share_location.dart';
import 'package:pip/features/menu/presentation/screens/terms_conditions_view.dart';
import 'package:pip/features/pip/presentation/screens/order_description_view.dart';
import 'package:pip/features/requests/presentation/screens/edit_offer_view.dart';
import 'package:pip/features/requests/presentation/screens/edit_request.dart';
import 'package:pip/features/requests/presentation/screens/info_view.dart';
import 'package:pip/features/requests/presentation/screens/requests_archieve_view.dart';
import '../../features/auth/business_logic/cubit/auth_cubit.dart';
import '../../features/auth/presentation/screens/confirm_otb_view.dart';
import '../../features/chat/presentation/screens/chats_view.dart';
import '../../features/chat/presentation/screens/conversation_type_view.dart';
import '../../features/home/data/models/ad_model.dart';
import '../../features/home/presentation/screens/companeis_need_jobs.view.dart';

import '../../features/home/presentation/screens/jobs_list_view.dart';

// import '../../features/map/presentation/screens/available_drivers.dart';
// import '../../features/map/presentation/screens/confirm_driver.dart';
import '../../features/menu/business_logic/menu_cubit.dart';
import '../../features/menu/presentation/screens/contact_us_view.dart';
import '../../features/menu/presentation/screens/edit_password_view.dart';
import '../../features/menu/presentation/screens/edit_profile_view.dart';
import '../../features/menu/presentation/screens/menu_view.dart';
import '../../features/menu/presentation/screens/rate_us_view.dart';
import '../../features/menu/presentation/screens/skills_view.dart';
import '../../features/menu/presentation/screens/wallet_view.dart';
import '../../features/menu/presentation/screens/who_we_are_view.dart';
import '../../features/menu/presentation/screens/work_with_us_view.dart';
import '../../features/notification/business_logic/cubit/notification_cubit.dart';
import '../../features/pip/business_logic/cubit/pip_cubit.dart';
import '../../features/pip/presentation/screens/available_drivers.dart';
import '../../features/pip/presentation/screens/confirm_driver.dart';
import '../../features/pip/presentation/screens/order_taxi_view.dart';
import '../../features/requests/data/models/my_request_model.dart';
import '../../features/requests/data/models/offer_model.dart';
import '../../features/search/business_logic/bloc/search_bloc.dart';
import '../../features/auth/presentation/screens/forgot_password_view.dart';
import '../../features/auth/presentation/screens/login_view.dart';
import '../../features/auth/presentation/screens/main_auth_view.dart';
import '../../features/auth/presentation/screens/register_view.dart';
import '../../features/chat/business_logic/chat_cubit.dart';
import '../../features/chat/presentation/screens/chat_main_view.dart';
import '../../features/home/presentation/screens/jop_details_view.dart';
import '../../features/home/presentation/screens/main_home_view.dart';
import '../../features/notification/presentation/screens/notification_view.dart';
import '../../features/pip/presentation/screens/fast_request_view.dart';
import '../../features/pip/presentation/screens/pick_request_type.dart';
import '../../features/pip/presentation/screens/special_request_details.dart';
import '../../features/requests/business_logic/cubit/requests_cubit.dart';
import '../../features/requests/presentation/screens/available_job_details.dart';
import '../../features/requests/presentation/screens/give_offer_view.dart';
import '../../features/requests/presentation/screens/my_requests_main_view.dart';
import '../../features/requests/presentation/screens/recieved_offer_details.dart';
import '../../features/requests/presentation/screens/recived_offers_view.dart';
import '../../features/requests/presentation/screens/wanted_job_request_details_view.dart';
import '../../features/search/presentation/screens/search_main_view.dart';

import '../../features/splash/presentation/screens/on_boarding_view.dart';
import '../../features/home/business_logic/cubit/home_cubit.dart';
import '../../features/home/presentation/screens/home_view.dart';
import '../../features/splash/presentation/screens/splash_view.dart';
import '../business_logic/global_cubit.dart';
import 'injection.dart';

class Routes {
  static const String splashRoute = "/splashRoute";
  static const String onBoardingViewRoute = "/onBoardingViewRoute";

  static const String mainAuthViewRoute = "/mainAuthViewRoute";
  static const String registerViewRoute = "/registerViewRoute";
  static const String loginViewRoute = "/loginViewRoute";
  static const String confirmOtbViewRoute = "/confirmOtbViewRoute";

  static const String forgotPasswordViewRoute = "/forgotPasswordViewRoute";

  static const String mainHomeViewRoute = "/mainHomeViewRoute";
  static const String infoViewRoute = "/infoViewRoute";

  static const String jobDetailsViewRoute = "/jobDetailsViewRoute";

  static const String notificationViewRoute = "/notificationViewRoute";
  static const String chooseTaxiViewRoute = "/chooseTaxiViewRoute";

  static const String searchMainViewRoute = "/searchMainViewRoute";
  static const String specialRequestViewRoute = "/specialRequestViewRoute";
  static const String fastRequestViewRoute = "/fastRequestViewRoute";
  static const String requestDetailsViewRoute = "/requestDetailsViewRoute";

  static const String recievedOffersViewRoute = "/recievedOffersViewRoute";
  static const String recievedOffersDetailsViewRoute =
      "/recievedOffersDetailsViewRoute";
  static const String availableJobDetailsViewRoute =
      "/availableJobDetailsViewRoute";
  static const String giveOffersViewRoute = "/giveOffersViewRoute";
  static const String editOffersViewRoute = "/editOffersViewRoute";

  static const String chatsViewRoute = "/chatsViewRoute";
  static const String chatViewRoute = "/chatViewRoute";
  static const String chatAddOfferViewRoute = "/chatAddOfferViewRoute";
  static const String editProfileViewRoute = "/editProfileViewRoute";
  static const String editPasswordViewRoute = "/editPasswordViewRoute";
  static const String contactViewRoute = "/contactViewRoute";
  static const String walletViewRoute = "/walletViewRoute";
  static const String whoWeAreViewRoute = "/whoWeAreViewRoute";
  static const String workWithUsViewRoute = "/workWithUsViewRoute";
  static const String skillsViewRoute = "/skillsViewRoute";
  static const String rateUsViewRoute = "/rateUsViewRoute";
  static const String shareLocationViewRoute = "/shareLocationViewRoute";

  static const String companiesNeedJobsViewRoute =
      "/companiesNeedJobsViewRoute";
  static const String jobsListView = "/jobsListView";
  static const String termsAndConditionViewRoute =
      "/termsAndConditionViewRoute";

  static const String editRequestViewRoute = "/editRequestViewRoute";

  static const String confirDriverViewRoute = "/confirDriverViewRoute";
  static const String giveOfferFromChatViewRoute =
      "/giveOfferFromChatViewRoute";
  static const String requestsArchieveViewRoute = "/requestsArchieveViewRoute";

  static const String orderDescriptionViewRoute = "/orderDescriptionViewRoute";

  static const String availableDriversViewRoute = "/availableDriversViewRoute";
}

class RouteGenerator {
  static late AuthCubit authCubit;
  static late GlobalCubit globalCubit;

  static late HomeCubit homeCubit;
  static late NotificationCubit notificationCubit;
  static late MenuCubit menuCubit;
  static late SearchBloc searchBloc;
  static late PipCubit pipCubit;
  static late RequestsCubit requestsCubit;
  static late ChatCubit chatCubit;

  RouteGenerator() {
    homeCubit = getIt<HomeCubit>();
    authCubit = getIt<AuthCubit>();
    notificationCubit = getIt<NotificationCubit>();
    menuCubit = getIt<MenuCubit>();
    searchBloc = getIt<SearchBloc>();
    pipCubit = getIt<PipCubit>();
    requestsCubit = getIt<RequestsCubit>();
    chatCubit = getIt<ChatCubit>();
    globalCubit = getIt<GlobalCubit>();
  }
  static List screens = <Widget>[
    const HomeView(),
    WillPopScope(
        onWillPop: () async {
          globalCubit.changeSelectedIndex(0);
          return false;
        },
        child: BlocProvider.value(
          value: pipCubit,
          child: const PickRequestTypeView(),
        )),
    MultiBlocProvider(
        providers: [
          BlocProvider.value(value: requestsCubit),
          BlocProvider.value(value: chatCubit),
          BlocProvider.value(value: pipCubit),
        ],
        child: WillPopScope(
            onWillPop: () async {
              globalCubit.changeSelectedIndex(0);
              return false;
            },
            child: const MyRequestsMainView())),
    BlocProvider.value(
      value: chatCubit,
      child: WillPopScope(
          onWillPop: () async {
            globalCubit.changeSelectedIndex(0);
            return false;
          },
          child: const ConversationsTypeView()),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: menuCubit,
        ),
        BlocProvider.value(
          value: requestsCubit,
        ),
        BlocProvider.value(
          value: chatCubit,
        ),
      ],
      child: WillPopScope(
          onWillPop: () async {
            globalCubit.changeSelectedIndex(0);
            return false;
          },
          child: const MenuView()),
    ),
  ];

  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );

      case Routes.orderDescriptionViewRoute:
        final arguments = settings.arguments as Map;
        final String title = arguments['title'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: pipCubit,
            child: OrderDescriptionView(
              title: title,
            ),
          ),
        );

      case Routes.mainAuthViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const MainAuthView(),
          ),
        );

      case Routes.loginViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const LoginView(),
          ),
        );

      case Routes.forgotPasswordViewRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
        );

      case Routes.registerViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const RegisterView(),
          ),
        );

      case Routes.mainHomeViewRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider.value(
                    value: homeCubit,
                  ),
                  BlocProvider.value(
                    value: menuCubit,
                  ),
                  BlocProvider.value(
                    value: pipCubit,
                  ),
                  BlocProvider.value(
                    value: requestsCubit,
                  ),
                ], child: const MainHomeView()));

      case Routes.notificationViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: notificationCubit,
            child: const NotificationView(),
          ),
        );

      case Routes.jobDetailsViewRoute:
        final arguments = settings.arguments as Map;

        final Ads ad = arguments['ad'];
        return MaterialPageRoute(
          builder: (_) => JobDetailsView(
            ad: ad,
          ),
        );

      case Routes.searchMainViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: searchBloc,
            child: const SearchMainView(),
          ),
        );
      case Routes.specialRequestViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: pipCubit,
            child: const SpecialRequestDetailsView(),
          ),
        );
      case Routes.fastRequestViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: pipCubit,
            child: const FastRequestView(),
          ),
        );

      case Routes.requestDetailsViewRoute:
        final arguments = settings.arguments as Map;

        final MyRequestModel request = arguments['request'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: requestsCubit,
            child: WantedJobRequestsDetailsView(
              request: request,
            ),
          ),
        );
      case Routes.chooseTaxiViewRoute:
        final arguments = settings.arguments as Map;

        final String title = arguments['title'];
        return MaterialPageRoute(
          builder: (_) => SelectLocation(
            fastRequestAppBarTitle: title,
          ),
        );

      case Routes.recievedOffersViewRoute:
        final arguments = settings.arguments as Map;

        final int id = arguments['requestId'];
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider.value(
              value: requestsCubit,
            ),
            BlocProvider.value(
              value: chatCubit,
            ),
          ], child: RecievedOffersView(id: id)),
        );

      case Routes.recievedOffersDetailsViewRoute:
        final arguments = settings.arguments as Map;

        final OfferModel offer = arguments['offer'];
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider.value(
              value: requestsCubit,
            ),
            BlocProvider.value(
              value: chatCubit,
            ),
          ], child: RecievedOfferDetailsView(offer: offer)),
        );

      case Routes.availableJobDetailsViewRoute:
        final arguments = settings.arguments as Map;

        final MyRequestModel availableJob = arguments['job'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: chatCubit,
            child: AvailableJobDetailsView(
              availableJob: availableJob,
            ),
          ),
        );

      case Routes.giveOffersViewRoute:
        final arguments = settings.arguments as Map;

        final String requestId = arguments['requestId'];
        final String jobName = arguments['jobName'];
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: requestsCubit,
                    ),
                    BlocProvider.value(
                      value: chatCubit,
                    ),
                  ],
                  child: GiveOfferView(
                    requestId: requestId,
                    jobName: jobName,
                  ),
                ));

      case Routes.editOffersViewRoute:
        // final arguments = settings.arguments as Map;

        // final String requestId = arguments['requestId'];
        // final String jobName = arguments['jobName'];
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: requestsCubit,
                    ),
                    // BlocProvider.value(
                    //   value: chatCubit,
                    // ),
                  ],
                  child: const EditOfferView(
                      // requestId: requestId,
                      // jobName:jobName ,
                      ),
                ));

      case Routes.chatsViewRoute:
        final arguments = settings.arguments as Map;

        final int chatId = arguments['chatId'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: chatCubit,
            child: ChatsView(
              jobChatsId: chatId,
            ),
          ),
        );
      case Routes.chatViewRoute:
        final arguments = settings.arguments as Map;

        final int chatId = arguments['chatId'];

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: chatCubit,
            child: ChatView(
              chatId: chatId,
            ),
          ),
        );

      case Routes.editProfileViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: menuCubit,
            child: const EditProfileView(),
          ),
        );

      case Routes.editPasswordViewRoute:
        return MaterialPageRoute(
          builder: (_) => const EditPasswordView(),
        );

      case Routes.contactViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: menuCubit,
            child: const ContactUsView(),
          ),
        );
      case Routes.walletViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: menuCubit,
            child: const WalletView(),
          ),
        );
      case Routes.whoWeAreViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: menuCubit,
            child: const WhoWeAreView(),
          ),
        );
      case Routes.workWithUsViewRoute:
        return MaterialPageRoute(
          builder: (_) => const WorkWithUsView(),
        );

      case Routes.infoViewRoute:
        return MaterialPageRoute(
          builder: (_) => const InfoView(),
        );

      case Routes.requestsArchieveViewRoute:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider.value(
         value: requestsCubit,
            child:const RequestsArchieveView(),
          ),
        );
      //  case Routes.giveOfferFromChatViewRoute:
      // final arguments = settings.arguments as Map;

      // final String chatId = arguments['chatId'];
      // return MaterialPageRoute(
      //   builder: (_) => MultiBlocProvider(
      //           providers: [
      //             BlocProvider.value(
      //               value: requestsCubit,
      //             ),
      //             BlocProvider.value(
      //               value: chatCubit,
      //             ),
      //           ],
      //           child: GiveOfferFromChatView(
      //             chatId: chatId,
      //           ),
      //         )
      // );

      case Routes.skillsViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: menuCubit,
            child: const SkillsView(),
          ),
        );
      case Routes.rateUsViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: menuCubit,
            child: const RateUsView(),
          ),
        );

      case Routes.companiesNeedJobsViewRoute:
        final arguments = settings.arguments as Map;

        final List<Ads> ads = arguments['ads'];
        final String typeHeadline = arguments['headline'];

        return MaterialPageRoute(
          builder: (_) => CompaniesNeedJobsView(
            ads: ads,
            typeHeadline: typeHeadline,
          ),
        );
      case Routes.jobsListView:
        final arguments = settings.arguments as Map;

        final List<Ads> ads = arguments['ads'];
        final String typeHeadline = arguments['headline'];
        return MaterialPageRoute(
          builder: (_) => JobsListView(
            ads: ads,
            typeHeadline: typeHeadline,
          ),
        );

      case Routes.confirDriverViewRoute:
        final arguments = settings.arguments as Map;
        final String fastRequestAppBarTitle = arguments['title'];
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: requestsCubit,
                      ),
                      BlocProvider.value(
                        value: pipCubit,
                      ),
                    ],
                    child: ConfirmDriverView(
                      fastRequestAppBarTitle: fastRequestAppBarTitle,
                    )));

      case Routes.availableDriversViewRoute:
        final arguments = settings.arguments as Map;
        final String fastRequestAppBarTitle = arguments['title'];
        final String requestId = arguments['requestId'];

        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: requestsCubit,
                      ),
                      BlocProvider.value(
                        value: pipCubit,
                      ),
                    ],
                    child: AvailableDriversView(
                        fastRequestAppBarTitle: fastRequestAppBarTitle,
                        requestId: requestId)));
      case Routes.termsAndConditionViewRoute:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditionView(),
        );
      case Routes.editRequestViewRoute:
        final arguments = settings.arguments as Map;

        final MyRequestModel request = arguments['request'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: requestsCubit,
            child: EditRequestView(
              request: request,
            ),
          ),
        );

      case Routes.confirmOtbViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const ConfirmPhoneView(),
          ),
        );
      case Routes.shareLocationViewRoute:
        final arguments = settings.arguments as Map;

        final int chatId = arguments['chatId'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: chatCubit,
            child: ShareLocation(
              chatId: chatId,
            ),
          ),
        );
      default:
        return null;
    }
  }

  // static Route<dynamic> unDefinedRoute() {
  //   return MaterialPageRoute(builder: (_) => DefaultScreen());
  // }
}
