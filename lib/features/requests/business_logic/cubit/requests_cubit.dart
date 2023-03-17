import 'package:bloc/bloc.dart';

import 'package:pip/features/requests/business_logic/cubit/requests_state.dart';
import 'package:pip/features/requests/data/models/my_request_model.dart';

import '../../../../core/web_services/network_exceptions.dart';
import '../../data/repository/request_repository.dart';

class RequestsCubit extends Cubit<RequestState> {
  RequestsCubit(this.requestRepository) : super(const RequestState.idle());

  final RequestRepository requestRepository;



  void getAllMyRequests() async {
    emit(const RequestState.myRequestsLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await requestRepository.getAllMyRequests();
    result.when(
      success: (List<MyRequestModel> requests) {

        emit(RequestState.myRequestsSuccess(requests));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.myRequestsError(networkExceptions));
      },
    );
  }

  void getAllAvailableJobs() async {
    emit(const RequestState.myAvailableJobsLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await requestRepository.getAllAvailableJobs();
    result.when(
      success: (List<MyRequestModel> availableJobs) {

        emit(RequestState.myAvailableJobsSuccess(availableJobs));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.myAvailableJobsError(networkExceptions));
      },
    );
  }
}
