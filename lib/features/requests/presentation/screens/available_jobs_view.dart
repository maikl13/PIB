import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/widgets/custom_title.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/cubit/requests_cubit.dart';
import '../../business_logic/cubit/requests_state.dart';
import '../../data/models/my_request_model.dart';
import '../widgets/request_item.dart';

class AvailableJobsView extends StatefulWidget {
  const AvailableJobsView({super.key});

  @override
  State<AvailableJobsView> createState() => _AvailableJobsViewState();
}

class _AvailableJobsViewState extends State<AvailableJobsView> {
  _buildBloc() {
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
              return const LoadingIndicator();
            },
            myAvailableJobsSuccess: (avaliableJobs) {
              return _buildList(avaliableJobs);
            },
            orElse: () => Container());
      },
    );
  }

  _buildList(List<MyRequestModel> availableJobs) {
    return ListView.separated(
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
            Navigator.pushNamed(context, Routes.availableJobDetailsViewRoute,
                arguments: {'job': availableJobs[index]});
          },
        );
      },
    );
  }

  @override
  void initState() {
        BlocProvider.of<RequestsCubit>(context).getAllAvailableJobs();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: EdgeInsets.only(top: 37.h),
      shrinkWrap: true,
      children: [
        const CustomTitle(title: AppStrings.recievedRequests),
        SizedBox(height: 20.h),
        _buildBloc(),
      ],
    );
  }
}
