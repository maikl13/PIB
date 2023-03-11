import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';

import '../../../../core/resources/color_manager.dart';
import '../widgets/recieved_item.dart';

class RecievedOffersView extends StatelessWidget {
  const RecievedOffersView({super.key});

  _buildListOfOffers() {
    return ListView.separated(
        padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const RecievedOfferItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 15.h,
          );
        },
        itemCount: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.recieveOffers,
        actions: const [],
      ),
      body: _buildListOfOffers(),
    );
  }
}
