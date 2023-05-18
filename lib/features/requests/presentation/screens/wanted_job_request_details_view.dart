import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/features/requests/business_logic/cubit/requests_cubit.dart';
import 'package:pip/features/requests/business_logic/cubit/requests_state.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_clock_date.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../data/models/my_request_model.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/image_item.dart';
import '../../../home/presentation/widgets/info_item.dart';
import '../../../home/presentation/widgets/main_info_item.dart';

class WantedJobRequestsDetailsView extends StatelessWidget {
  const WantedJobRequestsDetailsView({super.key, required this.request});

  final MyRequestModel request;

  _buildImage() {
    return SizedBox(
        width: 150.w,
        height: 150.w,
        child: CircleAvatar(
          radius: 80.r,
          child: ClipOval(
            child: request.images!.isEmpty && request.category == null
                ? Container()
                : CustomNetworkCachedImage(
                    url: request.images!.isEmpty
                        ? request.category!.imageUrl!
                        : request.images!.first.attachmentUrl!),
          ),
        ));
  }

  _buildBloc(RequestsCubit requestsCubit) {
    return BlocListener<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          completeRequestLoading: () {
            Commons.showLoadingDialog(context);
          },
          completeRequestError: (networkExceptions) => {
            Navigator.pop(context),
            Commons.showToast(message: networkExceptions.toString()),
          },
          completeRequestSuccess: (data) {
            Commons.showToast(
                message: 'تم اكمال الطلب بنجاح', color: ColorManager.toastSuccess);

            screenIndex = 2;
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.mainHomeViewRoute, (route) => false);
          },
          deleteRequestTapped: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: ColorManager.lightBlack,
                  title: Text(
                    "تنبيه",
                    style: getBoldStyle(
                        fontSize: 16.sp, color: ColorManager.white),
                  ),
                  content: Text(
                    "هل انت متاكد من حذف الطلب ؟",
                    style: getBoldStyle(
                        fontSize: 16.sp, color: ColorManager.white),
                  ),
                  actions: [
                    TextButton(
                      child: Text(
                        AppStrings.confirm,
                        style: getBoldStyle(
                            fontSize: 16.sp, color: ColorManager.white),
                      ),
                      onPressed: () {
                        // Navigator.of(context).pop();
                        requestsCubit.deleteRequest(
                          id: request.id.toString(),
                        );
                      },
                    ),
                    TextButton(
                      child: Text(
                        'الغاء',
                        style: getBoldStyle(
                            fontSize: 16.sp, color: ColorManager.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        // BlocProvider.of<RequestsCubit>(context).deleteRequest(
                        //   id: request.id.toString(),
                        // );
                      },
                    ),
                  ],
                );
              },
            );
          },
          deleteRequestLoading: () {
            Commons.showLoadingDialog(context);
          },
          deleteRequestError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
          deleteRequestSuccess: (data) {
            Navigator.pop(context);
            Commons.showToast(
                message: ' تم حذف الطلب بنجاح', color: ColorManager.toastSuccess);
            screenIndex = 2;
            Navigator.pushReplacementNamed(context, Routes.mainHomeViewRoute);
          },
        );
      },
      child: Container(),
    );
  }

  _buildBody(BuildContext context, RequestsCubit requestsCubit) {
    return BlocProvider.value(
      value: RouteGenerator.requestsCubit,
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 60.h),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.c,
            // shrinkWrap: true,
            children: [
              _buildBloc(requestsCubit),
              _buildImage(),
              SizedBox(height: 48.h),
              // _buildCompanyName(),
              // SizedBox(height: 15.h),
              _buildJobname(),
              SizedBox(height: 20.h),
              _buildRandomText(),
              SizedBox(height: 12.h),
              CustomClockDate(date: request.createdAt.toString()),
              SizedBox(height: 40.h),
              _buildMainInfo(),
              SizedBox(height: 15.h),
              InfoItem(
                leading: ImageAssets.pin1,
                title: request.location ?? '',
                // trailling: FontAwesomeIcons.mapLocationDot,
              ),
              SizedBox(height: 15.h),
              if(request.images!.length != 0)    _buildPhotos(),

              SizedBox(height: 30.h),
              _buildButton(context),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    if (request.status == 'active') {
      return DefaultButton(
        text: '${AppStrings.showOffers}  ${request.offersCount}',
        onTap: () {
          Navigator.of(context)
              .pushNamed(Routes.recievedOffersViewRoute, arguments: {
            'requestId': request.id,
          });
        },
        // widht: 249.w,
      );
    } else if (request.status == 'processing') {
      return DefaultButton(
        text: 'اكتمال الطلب',
        onTap: () {
          BlocProvider.of<RequestsCubit>(context)
              .completeRequest(id: request.id.toString());
        },
        // widht: 249.w,
      );
    } else {
      return DefaultButton(
        text: getStatusInArabic(request.status!),
        onTap: () {
          // Commons.showToast(message: ' حالة الطلب  ${request.status}');
        },
      );
    }
  }

  /* 
  request.status == 'active'
        ? 
        : */

  _buildPhotos() {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ImageItem(imageUrl: request.images![index].attachmentUrl!);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
          itemCount: request.images!.length),
    );
  }

  _buildJobname() {
    return Text(request.category == null ? '' : request.category!.name ?? '',
        style:
            getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry));
  }

  _buildRandomText() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Text(request.description ?? '',
          textAlign: TextAlign.center,
          style: getBoldStyle(fontSize: 13.sp, color: ColorManager.grey)),
    );
  }

  _buildMainInfo() {
    return Container(
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
        color: ColorManager.lightBlack,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MainInfoItem(
                title: '${request.offersCount} ${AppStrings.offerd}',
                icon: ImageAssets.user),
            MainInfoItem(
                title: '${request.price ?? ''} ${AppStrings.ryal}',
                icon: ImageAssets.tags),
            MainInfoItem(
                title: getStatusInArabic(request.status!),
                icon: ImageAssets.solidLayers),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final requestsCubit = BlocProvider.of<RequestsCubit>(context);

    return BlocProvider.value(
      value: RouteGenerator.requestsCubit,
      child: Scaffold(
        appBar: CustomAppBar(
          appBarColor: ColorManager.lightBlack,
          title: AppStrings.requestDetails,
          actions: request.status == 'active'
              ? [
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: ColorManager.darkSeconadry,
                      size: 18.sp,
                    ),
                    onPressed: () {
                      Commons.showSettingDialog(
                        context,
                        onDeleteTap: () {
                          BlocProvider.of<RequestsCubit>(context)
                              .deleteRequestTapped();
                        },
                        onEditTab: () {
                          Navigator.of(context).pushNamed(
                              Routes.editRequestViewRoute,
                              arguments: {
                                'request': request,
                              });
                        },
                      );
                    },
                  ),
                ]
              : [],
        ),
        body: _buildBody(context, requestsCubit),
      ),
    );
  }
}
