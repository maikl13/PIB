import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pip/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:pip/features/auth/presentation/screens/confirm_otb_view.dart';
import 'package:pip/features/chat/presentation/screens/chat_add_offer_view.dart';
import 'package:pip/features/chat/presentation/screens/chats_view.dart';
import 'package:pip/features/chat/presentation/screens/conversation_type_view.dart';
import 'package:pip/features/home/data/models/ad_model.dart';
import 'package:pip/features/home/presentation/screens/companeis_need_jobs.view.dart';
import 'package:pip/features/home/presentation/screens/full_time_jobs_view.dart';
import 'package:pip/features/home/presentation/screens/part_time_jobs_view.dart';
import 'package:pip/features/map/presentation/screens/available_drivers.dart';
import 'package:pip/features/map/presentation/screens/confirm_driver.dart';
import 'package:pip/features/menu/business_logic/menu_cubit.dart';
import 'package:pip/features/menu/presentation/screens/contact_us_view.dart';
import 'package:pip/features/menu/presentation/screens/edit_password_view.dart';
import 'package:pip/features/menu/presentation/screens/edit_profile_view.dart';
import 'package:pip/features/menu/presentation/screens/menu_view.dart';
import 'package:pip/features/menu/presentation/screens/rate_us_view.dart';
import 'package:pip/features/menu/presentation/screens/skills_view.dart';
import 'package:pip/features/menu/presentation/screens/wallet_view.dart';
import 'package:pip/features/menu/presentation/screens/who_we_are_view.dart';
import 'package:pip/features/menu/presentation/screens/work_with_us_view.dart';
import 'package:pip/features/notification/business_logic/cubit/notification_cubit.dart';
import 'package:pip/features/pip/business_logic/cubit/pip_cubit.dart';
import 'package:pip/features/search/business_logic/bloc/search_bloc.dart';
import '../../features/auth/presentation/screens/forgot_password_view.dart';
import '../../features/auth/presentation/screens/login_view.dart';
import '../../features/auth/presentation/screens/main_auth_view.dart';
import '../../features/auth/presentation/screens/register_view.dart';
import '../../features/chat/presentation/screens/contact_us_view.dart';
import '../../features/home/presentation/screens/jop_details_view.dart';
import '../../features/home/presentation/screens/main_home_view.dart';
import '../../features/map/presentation/screens/order_taxi_view.dart';
import '../../features/notification/presentation/screens/notification_view.dart';
import '../../features/pip/presentation/screens/fast_request_view.dart';
import '../../features/pip/presentation/screens/pick_request_type.dart';
import '../../features/pip/presentation/screens/special_request_details.dart';
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
import 'injection.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingViewRoute = "/onBoardingViewRoute";

  static const String mainAuthViewRoute = "/mainAuthViewRoute";
  static const String registerViewRoute = "/registerViewRoute";
  static const String loginViewRoute = "/loginViewRoute";
  static const String confirmOtbViewRoute = "/confirmOtbViewRoute";

  static const String forgotPasswordViewRoute = "/forgotPasswordViewRoute";

  static const String mainHomeViewRoute = "/mainHomeViewRoute";
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
  static const String companiesNeedJobsViewRoute =
      "/companiesNeedJobsViewRoute";
  static const String partTimeViewRoute = "/partTimeViewRoute";
  static const String fullTimeViewRoute = "/fullTimeViewRoute";
  static const String confirDriverViewRoute = "/confirDriverViewRoute";
  static const String availableDriversViewRoute = "/availableDriversViewRoute";
}

class RouteGenerator {
  static late AuthCubit authCubit;

  static late HomeCubit homeCubit;
  static late NotificationCubit notificationCubit;
  static late MenuCubit menuCubit;
  static late SearchBloc searchBloc;
  static late PipCubit pipCubit;

  RouteGenerator() {
    homeCubit = getIt<HomeCubit>();
    authCubit = getIt<AuthCubit>();
    notificationCubit = getIt<NotificationCubit>();
    menuCubit = getIt<MenuCubit>();
    searchBloc = getIt<SearchBloc>();
    pipCubit = getIt<PipCubit>();
  }
  static List screens = <Widget>[
    const HomeView(),
    const PickRequestTypeView(),
    const MyRequestsMainView(),
    const ConversationsTypeView(),
    BlocProvider.value(
      value: menuCubit,
      child: const MenuView(),
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
      case Routes.mainAuthViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const MainAuthView(),
          ),
        );

      case Routes.loginViewRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
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
          builder: (_) => BlocProvider.value(
            value: homeCubit,
            child: const MainHomeView(),
          ),
        );

      case Routes.notificationViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: notificationCubit,
            child: const NotificationView(),
          ),
        );

      case Routes.jobDetailsViewRoute:
        return MaterialPageRoute(
          builder: (_) => const JobDetailsView(),
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
          builder: (_) => const FastRequestView(),
        );

      case Routes.requestDetailsViewRoute:
        return MaterialPageRoute(
          builder: (_) => const WantedJobRequestsDetailsView(),
        );
      case Routes.chooseTaxiViewRoute:
        return MaterialPageRoute(
          builder: (_) => const SelectLocation(),
        );

      case Routes.recievedOffersViewRoute:
        return MaterialPageRoute(
          builder: (_) => const RecievedOffersView(),
        );

      case Routes.recievedOffersDetailsViewRoute:
        return MaterialPageRoute(
          builder: (_) => const RecievedOfferDetails(),
        );

      case Routes.availableJobDetailsViewRoute:
        return MaterialPageRoute(
          builder: (_) => const AvailableJobDetailsView(),
        );

      case Routes.giveOffersViewRoute:
        return MaterialPageRoute(
          builder: (_) => const GiveOfferView(),
        );

      case Routes.chatsViewRoute:
        return MaterialPageRoute(
          builder: (_) => const ChatsView(),
        );
      case Routes.chatViewRoute:
        return MaterialPageRoute(
          builder: (_) => const ChatView(),
        );
      case Routes.chatAddOfferViewRoute:
        return MaterialPageRoute(
          builder: (_) => const ChatAddOfferViewRoute(),
        );
      case Routes.editProfileViewRoute:
        return MaterialPageRoute(
          builder: (_) => const EditProfileView(),
        );

      case Routes.editPasswordViewRoute:
        return MaterialPageRoute(
          builder: (_) => const EditPasswordView(),
        );

      case Routes.contactViewRoute:
        return MaterialPageRoute(
          builder: (_) => const ContactUsView(),
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
          builder: (_) => const WhoWeAreView(),
        );
      case Routes.workWithUsViewRoute:
        return MaterialPageRoute(
          builder: (_) => const WorkWithUsView(),
        );
      case Routes.skillsViewRoute:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider.value(
            value: menuCubit,
       
            child:const SkillsView(),
          ),
        );
      case Routes.rateUsViewRoute:
        return MaterialPageRoute(
          builder: (_) => const RateUsView(),
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
      case Routes.partTimeViewRoute:
        final arguments = settings.arguments as Map;

        final List<Ads> ads = arguments['ads'];
        final String typeHeadline = arguments['headline'];
        return MaterialPageRoute(
          builder: (_) => PartTimeJobs(
            ads: ads,
            typeHeadline: typeHeadline,
          ),
        );
      case Routes.fullTimeViewRoute:
        final arguments = settings.arguments as Map;

        final List<Ads> ads = arguments['ads'];
        final String typeHeadline = arguments['headline'];
        return MaterialPageRoute(
          builder: (_) => FullTimeJobsView(
            ads: ads,
            typeHeadline: typeHeadline,
          ),
        );

      case Routes.confirDriverViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const ConfirmDriverView(),
          ),
        );

      case Routes.availableDriversViewRoute:
        return MaterialPageRoute(
          builder: (_) => const AvailableDriversView(),
        );

      case Routes.confirmOtbViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const ConfirmPhoneView(),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound.trim()),
              ),
              body: Center(child: Text(AppStrings.noRouteFound.trim())),
            ));
  }
}
