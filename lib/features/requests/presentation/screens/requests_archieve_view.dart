import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/features/requests/business_logic/cubit/requests_cubit.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/accepted_requests_item.dart';

class RequestsArchieveView extends StatelessWidget {
  const RequestsArchieveView({super.key});

  _buildMyAcceptedOffersList(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      itemCount: BlocProvider.of<RequestsCubit>(context).completedOffers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemBuilder: (context, index) {
        return AcceptedRequestItem(
            requests: BlocProvider.of<RequestsCubit>(context).completedOffers,
            onTap: () {},
            index: index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: 'ارشيف الطلبات',
        actions: const [],
      ),
      body: _buildMyAcceptedOffersList(context),
    );
  }
}
