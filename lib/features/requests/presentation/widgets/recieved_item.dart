import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../chat/business_logic/chat_state.dart';
import '../../../../core/widgets/custom_clock_date.dart';
import '../../../chat/business_logic/chat_cubit.dart';
import '../../business_logic/cubit/requests_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/dark_default_button.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../home/presentation/widgets/image_with_stars.dart';
import '../../data/models/offer_model.dart';

class RecievedOfferItem extends StatelessWidget {
  const RecievedOfferItem(
      {super.key, required this.offers, required this.index});
  final List<OfferModel> offers;
  final int index;

  _buildBackground() {
    return Image.asset(
      ImageAssets.bigBackground,
      fit: BoxFit.fill,
    );
  }

  _buildAvatar() {
    return SizedBox(
        width: 75.w,
        height: 65.w,
        child: ImageWithRating(
          image: offers[index].user!.imageUrl,
        ));
  }

  _buildMainInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, right: 13.w),
      child: SizedBox(
        width: 158.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAvatar(),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserName(),
                SizedBox(height: 9.h),
                Row(
                  children: [
                    _buildPriceIcon(),
                    SizedBox(width: 10.w),
                    _buildPrice(),
                    SizedBox(width: 18.w),
                    _buildTimeIcon(),
                    SizedBox(width: 10.w),
                    _buildTime(),
                  ],
                ),
                SizedBox(height: 15.h),
                _buildDescription(),
                SizedBox(height: 25.h),

                _buildButtons(context),
                // _buildPrice(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildButtons(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listener: (context, state) {
        state.whenOrNull(
            // chatWithUserError: (networkExceptions) {
            //   Commons.showToast(message: networkExceptions.toString());
            // },
            );
      },
      child: Row(
        children: [
          _buildAcceptButton(context),
          SizedBox(width: 10.w),
          _buildNegotiateButton(context),
        ],
      ),
    );
  }

  _buildAcceptButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.accept,
      height: 32.h,
      widht: 108.w,
      textStyle: getBoldStyle(fontSize: 12.sp, color: ColorManager.black),
      onTap: () {
        BlocProvider.of<RequestsCubit>(context)
            .acceptOffer(offerId: offers[index].id.toString());
      },
    );
  }

  _buildNegotiateButton(BuildContext context) {
    return DarkDefaultButton(
      text: AppStrings.negotiate,
      height: 32.h,
      widht: 108.w,
      borderColor: ColorManager.darkSeconadry,
      textStyle:
          getBoldStyle(fontSize: 12.sp, color: ColorManager.darkSeconadry),
      onTap: () {
        BlocProvider.of<ChatCubit>(context).chatWithUser(
            requestId: offers[index].dealId.toString(),
            targetId: offers[index].user!.id.toString());
      },
    );
  }

  _buildDescription() {
    return SizedBox(
      width: 214.w,
      child: Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        offers[index].description ?? '',
        style: getRegularStyle(fontSize: 12.sp, color: ColorManager.darkGrey),
      ),
    );
  }

  _buildPriceIcon() {
    return Icon(
      FontAwesomeIcons.tags,
      color: ColorManager.darkSeconadry,
      size: 15.sp,
    );
  }

  _buildPrice() {
    return Text(
      '${offers[index].price} \$',
      style: getRegularStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  _buildTimeIcon() {
    return Icon(
      FontAwesomeIcons.solidClock,
      color: ColorManager.darkSeconadry,
      size: 15.sp,
    );
  }

  _buildTime() {
    return Text(
      '${offers[index].duration} ايام',
      style: getRegularStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  _buildUserName() {
    return Text(
      offers[index].user!.name ?? '',
      style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.recievedOffersDetailsViewRoute,
            arguments: {
              'offer': offers[index],
            });
      },
      child: Container(
        height: 198.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        // color: Colors.red,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackground(),
            _buildMainInfo(context),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 14.h),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomClockDate(date: offers[index].createdAt!)),
            ),
          ],
        ),
      ),
    );
  }
}
