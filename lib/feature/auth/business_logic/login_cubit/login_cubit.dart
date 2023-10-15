import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/local_database/secure_storage.dart';
import '../../date/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo, this.secureStorage) : super(LoginInitial());
  final AuthRepo authRepo;
  final SecureStorage secureStorage;

  final TextEditingController emailController =
  TextEditingController(text: 'nopy1@nopy.com');

  final TextEditingController passwordController =
  TextEditingController(text: '12345678');
  final formKey = GlobalKey<FormState>();

  void login({required String email, required String password}) {
    emit(LoginLoading());
    authRepo.login(email: email, password: password).then(
      (value) {
        secureStorage.writeSecureData('token', value.token!);
        emit(LoginSuccess());
      },
    ).catchError(
      (onError) {
        emit(
          LoginError(onError.toString()),
        );
      },
    );
  }


}
