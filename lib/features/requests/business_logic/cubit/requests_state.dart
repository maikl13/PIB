import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pip/features/pip/data/models/skills_model.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../data/models/my_request_model.dart';
part 'requests_state.freezed.dart';

@freezed
class RequestState<T> with _$RequestState<T> {
  const factory RequestState.idle() = Idle<T>;

  const factory RequestState.myRequestsLoading() = MyRequestsLoading<T>;

  const factory RequestState.myRequestsSuccess(List<MyRequestModel> myRequests) = MyRequestsSuccess<T>;

  const factory RequestState.myRequestsError(NetworkExceptions networkExceptions) =
      MyRequestsError<T>;




  const factory RequestState.myAvailableJobsLoading() = MyAvailableJobsLoading<T>;

  const factory RequestState.myAvailableJobsSuccess(List<MyRequestModel> myRequests) = MyAvailableJobsSuccess<T>;

  const factory RequestState.myAvailableJobsError(NetworkExceptions networkExceptions) =
      MyAvailableJobsError<T>;
}
