import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/local_database/secure_storage.dart';
import '../../date/model/register_mode.dart';
import '../../date/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo, this.secureStorage) : super(RegisterInitial());
  final AuthRepo authRepo;
  final SecureStorage secureStorage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void register(RegisterRequest registerModel) {
    emit(RegisterLoading());
    authRepo.register(registerModel).then((value) {
      secureStorage.writeSecureData('token', value.token!);
      emit(RegisterSuccess());
    }).catchError((error) {
      emit(RegisterError(error));
    });
  }
}
