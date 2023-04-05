import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/features/requests/presentation/widgets/accepted_requests_item.dart';
import '../../../pip/business_logic/cubit/pip_cubit.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/dark_default_button.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../pip/data/models/driver_model.dart';
import '../../business_logic/cubit/requests_cubit.dart';
import '../../business_logic/cubit/requests_state.dart';
import '../../data/models/accepted_offers_model.dart';
import '../../data/models/available_fast_request_model.dart';
import '../../data/models/my_request_model.dart';
import '../widgets/available_fast_request.dart';
import '../widgets/request_item.dart';

class AvailableJobsView extends StatefulWidget {
  const AvailableJobsView({super.key});

  @override
  State<AvailableJobsView> createState() => _AvailableJobsViewState();
}

class _AvailableJobsViewState extends State<AvailableJobsView> {
  _buildAvailableJobsBloc() {
    return BlocConsumer<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          myAvailableJobsError: (networkExceptions) {
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
        );
      },
      buildWhen: (previous, next) => next is MyAvailableJobsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
            myAvailableJobsLoading: () {
              return Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const LoadingIndicator());
            },
            myAvailableJobsSuccess: (avaliableJobs) {
              return _buildAvailableRequestsView();
            },
            orElse: () => Container());
      },
    );
  }

  _buildAvailableFastRequestsBloc() {
    return BlocConsumer<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          acceptFastRequestLoading: () {
            Commons.showLoadingDialog(context);
          },
          acceptFastRequestError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
          acceptFastRequestSuccess: (data) {
            BlocProvider.of<PipCubit>(context).stopStream();
            Navigator.pop(context);
            Commons.showToast(
              color: ColorManager.toastSuccess,
              message: 'تم قبول الطلب بنجاح',
            );
            BlocProvider.of<RequestsCubit>(context)
                .getAllMyAvailableFastRequests();
          },
          rejectFastRequestSuccess: (data) {
            BlocProvider.of<PipCubit>(context).stopStream();
            Navigator.pop(context);
            Commons.showToast(
              color: ColorManager.toastSuccess,
              message: 'تم رفض الطلب بنجاح',
            );
            BlocProvider.of<RequestsCubit>(context)
                .getAllMyAvailableFastRequests();
          },
          myAvailableFastRequestsError: (networkExceptions) {
            Commons.showToast(
                message: NetworkExceptions.getErrorMessage(networkExceptions));
          },
        );
      },
      buildWhen: (previous, next) => next is MyAvailableFastRequestsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
            myAvailableFastRequestsLoading: () {
              return Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const LoadingIndicator());
            },
            myAvailableFastRequestsSuccess: (myFastRequests) {
              return myFastRequests.isEmpty
                  ? const SizedBox.shrink()
                  : _buildAvailableFastRequestsView();
            },
            orElse: () => Container());
      },
    );
  }

  _buildBodyView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMyAcceptedOffersBloc(),
          _buildAvailableFastRequestsBloc(),
          _buildAvailableJobsBloc(),
          // SizedBox(height: 20.h),
        ],
      ),
    );
  }

  _buildMyAcceptedOffersBloc() {
    return BlocConsumer<RequestsCubit, RequestState>(
      listener: (context, state) {},
      buildWhen: (previous, next) => next is MyAcceptedFastOffersSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          myAcceptedFastOffersSuccess: (myAcceptedFastOffers) {
            return myAcceptedFastOffers.isEmpty
                ? const SizedBox.shrink()
                : _buildMyAcceptedOffersView();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  _buildMyAcceptedOffersView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        const CustomTitle(title: '${AppStrings.myAcceptedOffers} :'),
        SizedBox(height: 20.h),
        _buildMyAcceptedOffersList(
            BlocProvider.of<RequestsCubit>(context).myAcceptedFastOffers),
      ],
    );
  }

  _buildMyAcceptedOffersList(List<AcceptedOffersModel> myAcceptedFastOffers) {
    return ListView.separated(
      itemCount: myAcceptedFastOffers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemBuilder: (context, index) {
        return myAcceptedFastOffers[index].status == 'processing'
            ? const SizedBox.shrink()
            : AcceptedRequestItem(
                requests: myAcceptedFastOffers, onTap: () {}, index: index);
      },
    );
  }

  _buildAvailableFastRequestsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        const CustomTitle(title: '${AppStrings.fastRequests} :'),
        SizedBox(height: 20.h),
        _buildFastReqestsList(
            BlocProvider.of<RequestsCubit>(context).myAvailableFastRequests),
      ],
    );
  }

  _buildAvailableRequestsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAvailableJobsList(
            BlocProvider.of<RequestsCubit>(context).myAvailableJobs),
      ],
    );
  }

  _buildFastReqestsList(List<AvailableFastRequestModel> fastRequequests) {
    return fastRequequests.isEmpty
        ? Container()
        : ListView.separated(
            itemCount: fastRequequests.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(height: 12.h);
            },
            itemBuilder: (context, index) {
              return fastRequequests[index].status == 'complete'
                  ? const SizedBox.shrink()
                  : AvailableFastReqquestItem(
                      fastRequests: fastRequequests,
                      index: index,
                    );
            },
          );
  }

  _buildAvailableJobsList(List<MyRequestModel> availableJobs) {
    return availableJobs.isEmpty
        ? _buildAvailableJobsEmpty()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const CustomTitle(title: AppStrings.availbleRecentJobs),
              SizedBox(height: 20.h),
              ListView.separated(
                itemCount: availableJobs.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(height: 12.h);
                },
                itemBuilder: (context, index) {
                  return RequestItem(
                    requests: availableJobs,
                    index: index,
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.availableJobDetailsViewRoute,
                          arguments: {'job': availableJobs[index]});
                    },
                  );
                },
              )
            ],
          );
  }

  _buildAvailableJobsEmpty() {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.work_outline_sharp,
              size: 100.sp,
              color: ColorManager.darkSeconadry,
            ),
          ),
          Text(
              'لا توجد وظائف لنفس المهارات التي حددتها ، سيصلك اشعار بمجرد وجود طلبات جديدة ، يمكنك ايضا تعديل مهاراتك من الزر ادناه',
              textAlign: TextAlign.center,
              style: getRegularStyle(
                  fontSize: 18.sp, color: ColorManager.darkGrey)),
          SizedBox(
            height: 25.h,
          ),
          DarkDefaultButton(
            widht: 195.w,
            height: 39.h,
            textStyle: getRegularStyle(
                fontSize: 15.sp, color: ColorManager.darkSeconadry),
            text: AppStrings.editSkills,
            borderColor: ColorManager.darkSeconadry,
            onTap: () {
              // BlocProvider.of<MenuCubit>(context).getUserInfo();
              Navigator.pushNamed(context, Routes.skillsViewRoute);
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<RequestsCubit>(context).getAllMyAvailableFastRequests();
    BlocProvider.of<RequestsCubit>(context).getAllAvailableJobs();
    BlocProvider.of<RequestsCubit>(context).getAllAcceptedOfferForDriver();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: EdgeInsets.only(top: 37.h),
      shrinkWrap: true,
      children: [
        _buildBodyView(),
      ],
    );
  }
}
