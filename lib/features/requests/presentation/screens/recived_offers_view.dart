import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/cubit/requests_cubit.dart';
import '../../business_logic/cubit/requests_state.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';

import '../../../../core/resources/color_manager.dart';
import '../../data/models/offer_model.dart';
import '../widgets/recieved_item.dart';

class RecievedOffersView extends StatefulWidget {
  const RecievedOffersView({super.key});

  @override
  State<RecievedOffersView> createState() => _RecievedOffersViewState();
}

class _RecievedOffersViewState extends State<RecievedOffersView> {
  _buildBloc() {
    return BlocConsumer<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          acceptOfferSuccess: (data) {
            Commons.showToast(
                message: 'تم قبول العرض بنجاح', color: ColorManager.green);
            screenIndex = 2;
            Navigator.of(context).pushNamed(Routes.mainHomeViewRoute);
          },
          acceptOfferError: (error) {
            Commons.showToast(message: error.toString());
          },
        );
      },
      buildWhen: (previous, next) => next is OffersSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          offersSuccess: (offers) {
            return _buildListOfOffers(offers);
          },
          offersLoading: () {
            return const LoadingIndicator();
          },
          orElse: () => Container(),
        );
      },
    );
  }

  Widget _buildListOfOffers(List<OfferModel> offers) {
    return ListView.separated(
        padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return RecievedOfferItem(offers: offers, index: index);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 15.h,
          );
        },
        itemCount: offers.length);
  }

  @override
  void initState() {
    BlocProvider.of<RequestsCubit>(context).getAllOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.recieveOffers,
        actions: const [],
      ),
      body: _buildBloc(),
    );
  }
}
