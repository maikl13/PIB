import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/widgets/empty_screen.dart';
import '../../business_logic/cubit/requests_cubit.dart';
import '../../business_logic/cubit/requests_state.dart';
import '../../data/models/my_request_model.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_title.dart';

import '../../../../core/resources/route_manager.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../widgets/request_item.dart';

class WantedJobRequestsView extends StatefulWidget {
  const WantedJobRequestsView({super.key});

  @override
  State<WantedJobRequestsView> createState() => _WantedJobRequestsViewState();
}

class _WantedJobRequestsViewState extends State<WantedJobRequestsView> {
  _buildBloc() {
    return BlocConsumer<RequestsCubit, RequestState>(
      listener: (context, state) {},
      buildWhen: (previous, next) => next is MyRequestsSuccess,
      builder: (context, state) {
        return state.maybeWhen(
            myRequestsLoading: () {
              return const LoadingIndicator();
            },
            myRequestsSuccess: (requests) {
              return _buildList(requests);
            },
            orElse: () => Container());
      },
    );
  }

  _buildList(List<MyRequestModel> requests) {
    return requests.isEmpty
        ? const EmptyScreen()
        : ListView.separated(
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

  @override
  void initState() {
    BlocProvider.of<RequestsCubit>(context).getAllMyRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 37.h),
      shrinkWrap: true,
      children: [
        const CustomTitle(title: AppStrings.jobsDownlodedPreviously),
        SizedBox(height: 20.h),
        _buildBloc(),
      ],
    );
  }
}
