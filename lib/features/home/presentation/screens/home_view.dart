import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../widgets/banners.dart';
import '../widgets/jobs_part.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  _buildHome(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 25.h, left: 20.w, right: 20.w),
      shrinkWrap: true,
      children: [
        _buildSearchBar(context),
        SizedBox(height: 30.h),
        _buildBanners(),
        SizedBox(height: 41.h),
        _buildJobsRequestByCompanies(context),
        SizedBox(height: 30.h),
        Divider(height: 1.h, color: ColorManager.grey),
        SizedBox(height: 35.h),
        _buildPartTimeJops(context),
        SizedBox(height: 30.h),
        Divider(height: 1.h, color: ColorManager.grey),
        SizedBox(height: 35.h),
        _buildFullTimeJops(context),
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

  _buildJobsRequestByCompanies(BuildContext context) {
    return JobsPart(
      headline: AppStrings.companiesRequireJobs,
      onShowAllTap: () {
        // print('adasd');
        Navigator.pushNamed(context, Routes.companiesNeedJobsViewRoute);
      },
    );
  }

  _buildPartTimeJops(BuildContext context) {
    return JobsPart(
      headline: AppStrings.partTimeJobs,
      onShowAllTap: () {
        // print('adasd');
        Navigator.pushNamed(context, Routes.partTimeViewRoute);
      },
    );
  }

  _buildFullTimeJops(BuildContext context) {
    return JobsPart(
      headline: AppStrings.fullTimeJobs,
      onShowAllTap: () {
        // print('adasd');
        Navigator.pushNamed(context, Routes.fullTimeViewRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHome(context);
  }
}
