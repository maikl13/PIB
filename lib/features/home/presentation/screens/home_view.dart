import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  _buildBloc() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      buildWhen: (previous, next) => next is HomeAdsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          homeAdsSuccess: (ads) {
            return _buildHome(context, ads);
          },
          homeAdsLoading: () {
            return const LoadingIndicator();
          },
          orElse: () {
            return Container();
          },
        );
      },
    );
  }

  _buildHome(BuildContext context, List<AdModel> ads) {
    return ListView(
      padding: EdgeInsets.only(top: 25.h, left: 20.w, right: 20.w),
      shrinkWrap: true,
      children: [
        _buildSearchBar(context),
        SizedBox(height: 30.h),
        _buildBanners(),
        SizedBox(height: 41.h),
        _buildJobsRequestByCompanies(context, ads[0]),
        SizedBox(height: 30.h),
        Divider(height: 1.h, color: ColorManager.grey),
        SizedBox(height: 35.h),
        _buildPartTimeJops(context, ads[1]),
        SizedBox(height: 30.h),
        Divider(height: 1.h, color: ColorManager.grey),
        SizedBox(height: 35.h),
        _buildFullTimeJops(context, ads[2]),
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
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: ColorManager.darkSeconadry,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(Ro.search);
                  })
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

  _buildJobsRequestByCompanies(BuildContext context, AdModel ad) {
    return JobsPart(
      ads: ad.ads!,
      headline: ad.name ?? '',
      onShowAllTap: () {
        // print('adasd');
        Navigator.pushNamed(context, Routes.companiesNeedJobsViewRoute,
            arguments: {
              'ads': ad.ads,
              'headline': ad.name,
            });
      },
    );
  }

  _buildPartTimeJops(BuildContext context, AdModel ad) {
    return JobsPart(
      ads: ad.ads!,
      headline: ad.name ?? '',
      onShowAllTap: () {
        // print('adasd');
        Navigator.pushNamed(context, Routes.partTimeViewRoute, arguments: {
          'ads': ad.ads,
          'headline': ad.name,
        });
      },
    );
  }

  _buildFullTimeJops(BuildContext context, AdModel ad) {
    return JobsPart(
      ads: ad.ads!,
      headline: ad.name ?? '',
      onShowAllTap: () {
        // print('adasd');
        Navigator.pushNamed(context, Routes.fullTimeViewRoute, arguments: {
          'ads': ad.ads,
          'headline': ad.name,
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getAllAds();
    return _buildBloc();
  }
}
