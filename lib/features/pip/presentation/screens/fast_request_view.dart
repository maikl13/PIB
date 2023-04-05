import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/commons.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/core/widgets/loading_indicator.dart';
import 'package:pip/features/pip/business_logic/cubit/pip_cubit.dart';
import 'package:pip/features/pip/business_logic/cubit/pip_state.dart';
import '../../../../core/resources/location_helper.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../data/models/fast_request_category.dart';
import '../widgets/pick_request_item.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/custom_switch.dart';

class FastRequestView extends StatefulWidget {
  const FastRequestView({super.key});

  @override
  State<FastRequestView> createState() => _FastRequestViewState();
}

class _FastRequestViewState extends State<FastRequestView> {
  _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFastRequestBloc(),
          SizedBox(height: 38.h),
          const CustomTitle(title: AppStrings.chooseTypeOfRequest),
          SizedBox(height: 20.h),
          _buildCategories(),
        ],
      ),
    );
  }

  _buildCategories() {
    return BlocConsumer<PipCubit, PipState>(
      listener: (context, state) {
        state.whenOrNull(
          fastRequestCategoryError: (networkExceptions) {
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
        );
      },
      buildWhen: (previous, current) => current is FastRequestCategorySuccess,
      builder: (context, state) {
        return state.maybeWhen(
          fastRequestCategoryLoading: () {
            return const LoadingIndicator();
          },
          fastRequestCategorySuccess: (categories) {
            return _buildList(categories);
          },
          orElse: () => Container(),
        );
      },
    );
  }

  _buildList(List<FastRequestCategory> categories) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PickRequestItem(
            title: categories[index].name ?? '',
            description: categories[index].description ?? '',
            onTap: () {
              categoryId = categories[index].id.toString();
              if (index == 0) {
                Navigator.pushNamed(context, Routes.chooseTaxiViewRoute,
                    arguments: {
                      'title': categories[index].name,
                    });
              } else if (index == 1) {
                Navigator.pushNamed(context, Routes.orderDescriptionViewRoute,
                    arguments: {
                      'title': categories[index].name,
                    });
              }
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.h);
        },
        itemCount: categories.length);
  }

  _buildFastRequestBloc() {
    return BlocConsumer<PipCubit, PipState>(
      listener: (context, state) {
        state.whenOrNull(
          toggleError: (networkExceptions) {
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
        );
      },
      buildWhen: (previous, current) => current is ToggleSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          idle: () {
            return _buildFastRequest(false);
          },
          toggleSuccess: (data) {
            fastRequsetStatus = data.action == 'enable' ? '1' : '0';
            return _buildFastRequest(data.action == 'enable' ? true : false);
          },
          orElse: () => _buildFastRequest(false),
        );
      },
    );
  }

  _buildFastRequest(bool? value) {
    return Container(
      width: double.infinity,
      height: 62.h,
      decoration: BoxDecoration(
          color: ColorManager.black5,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Row(
          children: [
            Text(
              AppStrings.wantReieveFastRequsets,
              style: getRegularStyle(
                  color: ColorManager.darkGrey, fontSize: 15.sp),
            ),
            const Spacer(),
            SizedBox(
              width: 37.w,
              height: 20.h,
              child: CustomSwitch(
                enabled: fastRequsetStatus == '0' ? false : true,
                onChanged: (status) {
                  BlocProvider.of<PipCubit>(context).toggleFastRequest();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<PipCubit>(context).toggleFastRequest();
    BlocProvider.of<PipCubit>(context).getAllFastRequestCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.fastRequest,
        actions: const [],
      ),
      body: _buildBody(context),
    );
  }
}
