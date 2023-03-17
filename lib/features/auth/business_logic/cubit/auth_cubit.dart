import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../data/models/auth_model.dart';
import '../../data/repository/auth_repository.dart';
import 'auth_state.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthCubit extends Cubit<AuthResultState<dynamic>> {
  AuthCubit(this.authRepoistry) : super(const Idle());
  final _auth = FirebaseAuth.instance;
  final AuthRepoistry authRepoistry;

  String verificationId = '';

  void login({
    required String uid,
  }) async {
    emit(const AuthResultState.loginLoading());
    var result = await authRepoistry.login(uid);
    result.when(
      success: (AuthModel userData) {
        // print(userData.user!.imageUrl);
        token = userData.token;
        userName = userData.user!.name;
        userPhone = userData.user!.phone;
        userImage = userData.user!.imageUrl;
        emit(AuthResultState.loginSuccess(userData));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(AuthResultState.loginError(networkExceptions));
      },
    );
  }

  void register({
    required String uid,
    required String name,
    String? email = '',
    String? phone = '',
    String? imageUrl = '',
  }) async {
    emit(const AuthResultState.registerLoading());
    var result = await authRepoistry.registerNewUser(
        token, name, email, phone, imageUrl);
    result.when(
      success: (AuthModel userData) {
        token = userData.token!;
        userName = userData.user!.name!;

        emit(AuthResultState.registerSuccess(userData));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(AuthResultState.registerError(networkExceptions));
      },
    );
  }

  signInWithGoogle(BuildContext context) async {
    emit(const AuthResultState.firebaseGoogleLoginLoading());
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>["email"]).signIn();
      token = googleUser!.id;
      userName = googleUser.displayName!;
      userEmail = googleUser.email;
      emit(AuthResultState.firebaseGoogleLoginSuccess(googleUser.id));
      print('gooooooogle ${googleUser.displayName!}');
      userImage = googleUser.photoUrl!;
    } catch (e) {
      print(e.toString());
      emit(AuthResultState.firebaseGoogleLoginError(
          NetworkExceptions.getDioException(e)));
    }
  }

  signInWithFacebook(BuildContext context) async {
    emit(const AuthResultState.firebaseFacebookLoginLoading());

    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // ignore: unused_local_variable
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final userData = await FacebookAuth.i.getUserData(
        fields: 'name,picture',
      );

      userName = userData['name'];
      token = userData['id'];
      userImage = userData['picture']['data']['url'];

      emit(AuthResultState.firebaseFacebookLoginSuccess(userData['id']));
    } catch (e) {
      print(e.toString());
      emit(AuthResultState.firebaseFacebookLoginError(
          NetworkExceptions.getDioException(e)));
    }

    // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(const AuthResultState.phoneAuthLoading());

    await _auth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: AppConstants.timeOut),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signInWithPhoneNumber(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(AuthResultState.phoneAuthErrorOccurred(error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;

    emit( AuthResultState.phoneNumberSubmited(_auth.currentUser!.uid));
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);

    await signInWithPhoneNumber(credential);
  }

  Future<void> signInWithPhoneNumber(PhoneAuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
      emit(const AuthResultState.phoneOTPVerified());
    } catch (error) {
      emit(AuthResultState.phoneAuthErrorOccurred(error.toString()));
    }
  }
}