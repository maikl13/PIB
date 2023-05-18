import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/rating_stars.dart';
import '../../business_logic/menu_cubit.dart';
import '../../business_logic/menu_state.dart';
import '../../data/models/rates_model.dart';

import '../../../../core/widgets/loading_indicator.dart';
import '../widgets/rate_item.dart';

class RateUsView extends StatefulWidget {
  const RateUsView({super.key});

  @override
  State<RateUsView> createState() => _RateUsViewState();
}

class _RateUsViewState extends State<RateUsView> {
  _buildBody() {
    return Padding(
      padding:
          EdgeInsets.only(right: 20.w, left: 16.w, top: 48.h, bottom: 30.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildBLoc(),
            Divider(color: ColorManager.darkGrey, thickness: 1.h),
            _buildRatingList(),
            SizedBox(height: 150.h),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  _buildButton() {
    return DefaultButton(
      text: AppStrings.send,
      onTap: () {
        BlocProvider.of<MenuCubit>(context).updateRate();
      },
    );
  }

  _buildRatingList() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is UpdateRateSuccess,
      builder: (context, state) {
        return Column(
          children: [
            _buildExperienceRate(),
            SizedBox(height: 40.h),
            _buildProfiisenalRate(),
            SizedBox(height: 40.h),
            _buildCommunicationRate(),
            SizedBox(height: 40.h),
            _buildQualityRate(),
            SizedBox(height: 40.h),
            _buildTimeRate(),
          ],
        );
      },
    );
  }

  _buildExperienceRate() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is UpdateExperienceRateSuccess,
      builder: (context, state) {
        return RateItem(
          title: 'التجربة',
          rateNumber: BlocProvider.of<MenuCubit>(context).experienceRate,
          onRatingUpdate: (rate) {
            setState(() {
              BlocProvider.of<MenuCubit>(context).updateExperienceRate(rate);
              // print(BlocProvider.of<MenuCubit>(context).experienceRate);
            });
          },
        );
      },
    );
  }

  _buildProfiisenalRate() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is UpdateProfessionlRateSuccess,
      builder: (context, state) {
        return RateItem(
          title: 'المهنية',
          rateNumber: BlocProvider.of<MenuCubit>(context).professionlRate,
          onRatingUpdate: (rate) {
            setState(() {
              BlocProvider.of<MenuCubit>(context).updateProfessionlRate(rate);
              // print(BlocProvider.of<MenuCubit>(context).professionlRate);
            });
          },
        );
      },
    );
  }

  _buildCommunicationRate() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      buildWhen: (previous, current) =>
          current is UpdateCommunicationRateSuccess,
      builder: (context, state) {
        return RateItem(
          title: 'التواصل',
          rateNumber: BlocProvider.of<MenuCubit>(context).communicationRate,
          onRatingUpdate: (rate) {
            setState(() {
              BlocProvider.of<MenuCubit>(context).updateCommunicationRate(rate);
              // print(BlocProvider.of<MenuCubit>(context).communicationRate);
            });
          },
        );
      },
    );
  }

  _buildQualityRate() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is UpdateQualityRate,
      builder: (context, state) {
        return RateItem(
          title: 'الجودة',
          rateNumber: BlocProvider.of<MenuCubit>(context).qualityRate,
          onRatingUpdate: (rate) {
            setState(() {
              BlocProvider.of<MenuCubit>(context).updateQualityRate(rate);
              // print(BlocProvider.of<MenuCubit>(context).qualityRate);
            });
          },
        );
      },
    );
  }

  _buildTimeRate() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is UpdateTimeRateSuccess,
      builder: (context, state) {
        return RateItem(
          title: 'الوقت',
          rateNumber: BlocProvider.of<MenuCubit>(context).timeRate,
          onRatingUpdate: (p0) {
            setState(() {
              BlocProvider.of<MenuCubit>(context).updateTimeRate(p0);
              // print(BlocProvider.of<MenuCubit>(context).timeRate);
            });
          },
        );
      },
    );
  }

  _buildBLoc() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        state.whenOrNull(
          updateRateLoading: () {
            Commons.showLoadingDialog(context);
          },
          updateRateSuccess: (rates) {
            Navigator.pop(context);
            Commons.showToast(
                message: 'تم التقييم بنجاح', color: ColorManager.toastSuccess);
            BlocProvider.of<MenuCubit>(context).getAllRates();
            Navigator.pop(context);
          },
          updateRateError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
        );
      },
      buildWhen: (previous, next) => next is GetRatesSuccess,
      builder: (context, state) {
        return state.maybeWhen(
            getRatesLoading: () {
              return const LoadingIndicator();
            },
            getRatesSuccess: (rates) {
              return _buildRates(rates);
            },
            orElse: () =>
                _buildRates(BlocProvider.of<MenuCubit>(context).ratesModel));
      },
    );
  }

  _buildRates(RatesModel rates) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAverageRating(
          rates.avgRating.toString(),
          rates.ratingsCount.toString(),
        ),
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
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is GetRatesSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          getRatesSuccess: (rates) {
            return SizedBox(
              // height: 120.h,
              width: 18.w,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Text(
                      BlocProvider.of<MenuCubit>(context)
                          .ratesFromOneToFive[index],
                      style: getRegularStyle(
                          fontSize: 15.sp, color: ColorManager.grey),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 4.h);
                  },
                  itemCount: 5),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MenuCubit>(context).getAllRates();
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
