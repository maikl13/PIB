import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/rating_stars.dart';
import 'package:pip/features/menu/business_logic/menu_cubit.dart';
import 'package:pip/features/menu/business_logic/menu_state.dart';
import 'package:pip/features/menu/data/models/rates_model.dart';

import '../../../../core/widgets/loading_indicator.dart';
import '../widgets/rate_item.dart';

class RateUsView extends StatefulWidget {
  const RateUsView({super.key});

  @override
  State<RateUsView> createState() => _RateUsViewState();
}

class _RateUsViewState extends State<RateUsView> {
  _buildBody() {
    return ListView(
      padding: EdgeInsets.only(right: 20.w, left: 16.w, top: 48.h),
      shrinkWrap: true,
      children: [
        _buildBLoc(),
        Divider(color: ColorManager.darkGrey, thickness: 1.h),
        _buildRatingList(),
      ],
    );
  }

  _buildRatingList() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const RateItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12.h);
        },
        itemCount: 4);
  }

  _buildBLoc() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      buildWhen: (previous, next) => next is GetRatesSuccess,
      builder: (context, state) {
        return state.maybeWhen(
            getRatesLoading: () {
              return const LoadingIndicator();
            },
            getRatesSuccess: (rates) {
              return _buildRates(rates);
            },
            orElse: () => Container());
      },
    );
  }

  _buildRates(RatesModel rates) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAverageRating(
            rates.avgRating.toString(), rates.ratingsCount.toString()),
        // SizedBox(width: 42.w),
        _buildRatingBarsChart(),
        _buildRatingNumbers(),
      ],
    );
  }

  _buildAverageRating(String averageOfRates, String totalNumberOfRates) {
    return Column(
      children: [
        Text(
          averageOfRates,
          style: getBoldStyle(fontSize: 35.sp, color: ColorManager.white),
        ),
        Text(
          totalNumberOfRates,
          style: getLightStyle(fontSize: 13.sp, color: ColorManager.grey),
        ),
      ],
    );
  }

  _buildRatingBarsChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRatingBarChart(100, numberOfStars: 5, rate: 5),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(right: 20.h),
          child: _buildRatingBarChart(70, numberOfStars: 4, rate: 4),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(right: 20 * 2.h),
          child: _buildRatingBarChart(30, numberOfStars: 3, rate: 3),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(right: 20 * 3.h),
          child: _buildRatingBarChart(20, numberOfStars: 2, rate: 2),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(right: 20 * 4.h),
          child: _buildRatingBarChart(10, numberOfStars: 1, rate: 1),
        ),
      ],
    );
  }

  Widget _buildRatingBarChart(double width,
      {int? numberOfStars, double? rate}) {
    return Row(
      children: [
        RatingStars(numberOfStars: numberOfStars ?? 5, initailRate: rate ?? 1),
        SizedBox(width: 10.w),
        Container(
          width: width.w,
          height: 5.h,
          decoration: BoxDecoration(
            color: ColorManager.red,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
        ),
      ],
    );
  }

  _buildRatingNumbers() {
    return SizedBox(
      // height: 120.h,
      width: 18.w,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Text(
              '0${BlocProvider.of<MenuCubit>(context).ratesFromOneToFive[index]}',
              style: getRegularStyle(fontSize: 15.sp, color: ColorManager.grey),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 4.h);
          },
          itemCount: 5),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MenuCubit>(context).getAllRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'قيمنا',
        appBarColor: ColorManager.lightBlack,
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
