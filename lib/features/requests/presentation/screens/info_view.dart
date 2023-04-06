import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/loading_indicator.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
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
              _buildBodyDescsc(),
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

  _buildBodyDescsc() {
    return Text(
      textAlign: TextAlign.center,
      'تظهر العروض الجاريه عندما يقوم الطرف الاخر بقبول عرضك ، حيث يمكنك متابعة الطلبات الجارية الخاصة بك وعرضها اقم باضافة عروض قوية و احصل علي تقيم مرتفع للحصول علي عدد اكبر من المهام',
      style: getRegularStyle(
              fontSize: 13.sp, color: ColorManager.white.withOpacity(.6))
          .copyWith(height: 2),
    );
  }

  _buildTitle() {
    return Text('معلومات عن التطبيق',
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
        title: 'معلومات ',
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
