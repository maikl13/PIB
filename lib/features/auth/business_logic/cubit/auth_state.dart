import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../data/models/auth_model.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthResultState<T> with _$AuthResultState<T> {
  const factory AuthResultState.idle() = Idle<T>;

  const factory AuthResultState.loginLoading() = LoginLoading<T>;
  const factory AuthResultState.loginSuccess(T uid) = LoginSuccess<T>;
   const factory AuthResultState.loginError(
      NetworkExceptions networkExceptions) = LoginError<T>;


 const factory AuthResultState.firebaseFacebookLoginSuccess(String data) =
      FirebaseFacebookLoginSuccess<T>;
  const factory AuthResultState.firebaseFacebookLoginLoading() = FirebaseFacebookLoginLoading<T>;
  const factory AuthResultState.firebaseFacebookLoginError(
      NetworkExceptions networkExceptions) = FirebaseFacebookLoginError<T>;
 

  const factory AuthResultState.registerLoading() = RegisterLoading<T>;
  const factory AuthResultState.registerSuccess(AuthModel userData) = RegisterSuccess<T>;
  const factory AuthResultState.registerError(
      NetworkExceptions networkExceptions) = RegisterError<T>;

  const factory AuthResultState.phoneAuthLoading() = PhoneAuthLoading<T>;
  const factory AuthResultState.phoneAuthErrorOccurred(String errorMsg) = PhoneAuthErrorOccurred<T>;
  const factory AuthResultState.phoneNumberSubmited() = PhoneNumberSubmited<T>;
  const factory AuthResultState.phoneOTPVerified() = PhoneOTPVerified<T>;


   const factory AuthResultState.firebaseAnonymousLoginSuccess(String data) =
      FirebaseAnonymousLoginSuccess<T>;
  const factory AuthResultState.firebaseAnonymousLoginLoading() = FirebaseAnonymousLoginLoading<T>;
  const factory AuthResultState.firebaseAnonymousLoginError(
      NetworkExceptions networkExceptions) = FirebaseAnonymousLoginError<T>;



const factory AuthResultState.firebaseGoogleLoginSuccess(String data) =
      FirebaseGoogleLoginSuccess<T>;
  const factory AuthResultState.firebaseGoogleLoginLoading() = FirebaseGoogleLoginLoading<T>;
  const factory AuthResultState.firebaseGoogleLoginError(
      NetworkExceptions networkExceptions) = FirebaseGoogleLoginError<T>;
 

}
/* 


 */