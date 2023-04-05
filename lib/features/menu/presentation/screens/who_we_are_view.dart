import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/setting_model.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/menu_cubit.dart';
import '../../business_logic/menu_state.dart';

class WhoWeAreView extends StatefulWidget {
  const WhoWeAreView({super.key});

  @override
  State<WhoWeAreView> createState() => _WhoWeAreViewState();
}

class _WhoWeAreViewState extends State<WhoWeAreView> {
  _buildLogo() {
    return Image.asset(
      ImageAssets.splashLogo,
      width: 88.w,
      height: 60.h,
    );
  }

  _buildBody() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogo(),
              SizedBox(height: 15.h),
              _buildTitle(),
              SizedBox(height: 15.h),
              _buildDescription(),
            ],
          ),
        ),
      ),
    );
  }

  // _buildSubTitle() {
  //   return Text(
  //     AppStrings.defaText,
  //     maxLines: 1,
  //     overflow: TextOverflow.clip,
  //     style: getRegularStyle(
  //         fontSize: 13.sp, color: ColorManager.darkSeconadry.withOpacity(.6)),
  //   );
  // }

  _buildDescription() {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current is GetSettingSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          getRatesLoading: () {
            return const LoadingIndicator();
          },
          getSettingSuccess: (settings) {
            return _buildBodyDescsc(settings);
          },
          orElse: () =>
              _buildBodyDescsc(BlocProvider.of<MenuCubit>(context).allSettings),
        );
      },
    );
  }

  _buildBodyDescsc(List<SettingModel> settings) {
    return Text(
      textAlign: TextAlign.center,
      settings[0].value!,
      style: getRegularStyle(
              fontSize: 13.sp, color: ColorManager.white.withOpacity(.6))
          .copyWith(height: 2),
    );
  }

  _buildTitle() {
    return Text(AppStrings.whoAreWe,
        style:
            getBoldStyle(fontSize: 18.sp, color: ColorManager.darkSeconadry));
  }

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MenuCubit>(context).getAllSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.whoAreWe,
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
