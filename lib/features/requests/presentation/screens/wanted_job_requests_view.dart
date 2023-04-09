import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/widgets/empty_screen.dart';
import '../../data/models/fast_request_model.dart';
import '../widgets/fast_request_item.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/dark_default_button.dart';
import '../../business_logic/cubit/requests_cubit.dart';
import '../../business_logic/cubit/requests_state.dart';
import '../../data/models/my_request_model.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../widgets/request_item.dart';
import '../../../../core/business_logic/global_cubit.dart';
import '../../../../core/business_logic/global_state.dart';

class WantedJobRequestsView extends StatefulWidget {
  const WantedJobRequestsView({super.key});

  @override
  State<WantedJobRequestsView> createState() => _WantedJobRequestsViewState();
}

class _WantedJobRequestsViewState extends State<WantedJobRequestsView> {
  _buildRequstsBloc() {
    return BlocConsumer<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          myRequestsError: (networkExceptions) {
            Commons.showToast(
                message: NetworkExceptions.getErrorMessage(networkExceptions));
          },
        );
      },
      buildWhen: (previous, next) => next is MyRequestsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
            myRequestsLoading: () {
              return Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const LoadingIndicator());
            },
            // myFastRequestsSuccess: (myFastRequests) {
            //   return _buildBodyView();
            // },
            myRequestsSuccess: (requests) {
              return (requests.isEmpty &&
                      BlocProvider.of<RequestsCubit>(context)
                          .myFastRequests
                          .isEmpty)
                  ? _buildEmpty()
                  : _buildRequestView();
            },
            orElse: () => Container());
      },
    );
  }

  _buildFastRequstsBloc() {
    return BlocConsumer<RequestsCubit, RequestState>(
      listener: (context, state) {
        state.whenOrNull(
          myFastRequestsError: (networkExceptions) {
            Commons.showToast(
                message: NetworkExceptions.getErrorMessage(networkExceptions));
          },
          completeFastRequestLoading: () {
            Commons.showLoadingDialog(context);
          },
          completeFastRequestError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
                message: NetworkExceptions.getErrorMessage(networkExceptions));
          },
          completeFastRequestSuccess: (data) {
            Navigator.pop(context);
            Commons.showToast(message: 'تم الانتهاء من الطلب بنجاح');
            BlocProvider.of<RequestsCubit>(context).getAllMyFastRequests();
          },
          cancelFastRequestLoading: () {
            Commons.showLoadingDialog(context);
          },
          cancelFastRequestError: (networkExceptions) {
            Navigator.pop(context);
            Commons.showToast(
                message: NetworkExceptions.getErrorMessage(networkExceptions));
          },
          cancelFastRequestSuccess: (data) {
            Navigator.pop(context);
            Commons.showToast(message: 'تم الغاء الطلب بنجاح');
            BlocProvider.of<RequestsCubit>(context).getAllMyFastRequests();
          },
        );
      },
      buildWhen: (previous, next) => next is MyFastRequestsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
            myFastRequestsLoading: () {
              return Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: LoadingIndicator());
            },
            myFastRequestsSuccess: (myFastRequests) {
              return myFastRequests.isEmpty
                  ? const SizedBox.shrink()
                  : _buildFastRequestView();
            },
            orElse: () => Container());
      },
    );
  }

  _buildReqestsList(List<MyRequestModel> requests) {
    return ListView.separated(
      itemCount: requests.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return SizedBox(height: 12.h);
      },
      itemBuilder: (context, index) {
        return RequestItem(
          requests: requests,
          index: index,
          onTap: () {
            Navigator.pushNamed(context, Routes.requestDetailsViewRoute,
                arguments: {'request': requests[index]});
          },
        );
      },
    );
  }

  _buildFastReqestsList(List<FastRequestModel> fastRequequests) {
    return (fastRequequests.isEmpty)
        ? Container()
        : ListView.separated(
            itemCount: fastRequequests.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(height: 12.h);
            },
            itemBuilder: (context, index) {
              return FastRequestItem(
                  fastRequest: fastRequequests[index],
                  onTap: () {
                    // var request = fastRequequests[index];

                    // myLocationLat = request.destinationFromLat!;
                    // myLocationLng = request.destinationFromLong!;
                    //  myDestinationLat = request.destinationToLat!;
                    //  myDestinationLng = request.destinationToLong!;

                    // Navigator.pushNamed(
                    //     context, Routes.availableDriversViewRoute,arguments: {
                    //   'title' : request.category!.name,
                    //   'requestId' : request.id.toString()
                    // });
                  });
            },
          );
  }

  _buildBodyView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          const CustomTitle(title: AppStrings.jobsDownlodedPreviously),
          _buildFastRequstsBloc(),
          _buildRequstsBloc(),
        ],
      ),
    );
  }

  _buildEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            ImageAssets.noData,
            height: 250,
          ),
        ),
        Text('لم تقم بعمل اي طلبات حتي الان ، يمكنك الطلب من صفحة PIB',
            textAlign: TextAlign.center,
            style: getBoldStyle(fontSize: 20.sp, color: ColorManager.darkGrey)),
        SizedBox(
          height: 25.h,
        ),
        DarkDefaultButton(
          widht: 195.w,
          height: 39.h,
          textStyle: getRegularStyle(
              fontSize: 15.sp, color: ColorManager.darkSeconadry),
          text: AppStrings.newRequest,
          borderColor: ColorManager.darkSeconadry,
          onTap: () {
            RouteGenerator.globalCubit.changeSelectedIndex(1);
          },
        )
      ],
    );
  }

  _buildFastRequestView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 20.h),
        // const CustomTitle(title: '${AppStrings.fastRequests} :'),
        SizedBox(height: 20.h),
        _buildFastReqestsList(
            BlocProvider.of<RequestsCubit>(context).myFastRequests),
      ],
    );
  }

  _buildRequestView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        // const CustomTitle(title: AppStrings.jobsDownlodedPreviously),
        // SizedBox(height: 20.h),
        _buildReqestsList(BlocProvider.of<RequestsCubit>(context).myRequests),
      ],
    );
  }

  @override
  void initState() {
    BlocProvider.of<RequestsCubit>(context).getAllMyRequests();
    BlocProvider.of<RequestsCubit>(context).getAllMyFastRequests();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBodyView();
  }
}
