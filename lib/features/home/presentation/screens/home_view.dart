import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/business_logic/global_cubit.dart';
import 'package:pip/core/resources/assets_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/location_helper.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../menu/business_logic/menu_cubit.dart';
import '../../../menu/business_logic/menu_state.dart';
import '../../../pip/business_logic/cubit/pip_cubit.dart';
import '../../business_logic/cubit/home_cubit.dart';
import '../../business_logic/cubit/home_state.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../data/models/ad_model.dart';
import '../widgets/banners.dart';
import '../widgets/jobs_part.dart';
import '../widgets/jobs_part_loading.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  _buildMenuCubit() {
    return BlocListener<MenuCubit, MenuState>(
      listener: (context, state) {
        state.whenOrNull(
          locationError: () =>
              BlocProvider.of<PipCubit>(context).toggleFastRequest(),
        );
      },
      child: Container(),
    );
  }

  _buildBloc() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          homeAdsError: (error) {
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(error),
            );
          },
        );
      },
      buildWhen: (previous, next) => next is HomeAdsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          homeAdsSuccess: (ads) {
            return _buildHome(context, ads , false);
          },
          homeAdsLoading: () {
            return _buildHome(context, [] , true);
          },
          orElse: () {
            return Container();
          },
        );
      },
    );
  }

  _buildHome(BuildContext context, List<AdModel> ads , bool loading) {
    return ListView(
      padding: EdgeInsets.only(top: 25.h, left: 20.w, right: 20.w),
      shrinkWrap: true,
      children: [
        _buildMenuCubit(),
        _buildSearchBar(context),
        SizedBox(height: 30.h),
        _buildBanners(),
        SizedBox(height: 41.h),
        _buildJobsSections(context, ads,loading),
      ],
    );
  }

  _buildSearchBar(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.searchMainViewRoute);
      },
      child: Container(
        width: double.infinity,
        height: 52.h,
        decoration: BoxDecoration(
          color: ColorManager.lightBlack,
          borderRadius: BorderRadius.circular(26.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.search,
                  style: getRegularStyle(
                      fontSize: 15.sp, color: ColorManager.grey)),
              Image.asset(
                ImageAssets.search,
                width: 20.w,
                height: 20.h,
                fit: BoxFit.contain,
              ),
              // IconButton(
              //     icon: Icon(
              //       Icons.search,
              //       color: ColorManager.darkSeconadry,
              //       size: 20.sp,
              //     ),
              //     onPressed: () {
              //       // Navigator.pushNamed(Ro.search);
              //     })
            ],
          ),
        ),
      ),
    );
    // return const SearchBar();
  }

  _buildBanners() {
    return const Banners();
  }

  _buildJobsSections(BuildContext context, List<AdModel> ads , bool loading) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return Column(

            children: [
             loading?  JobsPartLoading() : _buildJobsSection(context, ads[i]),
              SizedBox(height: 30.h),
              if(i+1 < ads.length) Divider(height: 1.h, color: ColorManager.grey),
              if(i+1 < ads.length)  SizedBox(height: 35.h),
            ],
          );
        },
        itemCount: loading ? 2 : ads.length);
  }

  _buildJobsSection(BuildContext context, AdModel ad) {
    return JobsPart(
      ads: ad.ads!,
      headline: ad.name ?? '',
      onShowAllTap: () {
        // print('adasd');
        Navigator.pushNamed(context, Routes.jobsListView, arguments: {
          'ads': ad.ads,
          'headline': ad.name,
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GlobalCubit>(context).getAllNotificationsCount();

    BlocProvider.of<HomeCubit>(context).getAllAds();

    return _buildBloc();
  }
}
