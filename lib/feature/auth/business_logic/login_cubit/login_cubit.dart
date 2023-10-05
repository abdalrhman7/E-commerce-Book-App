import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/local_database/secure_storage.dart';
import '../../date/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo, this.secureStorage) : super(LoginInitial());
  final AuthRepo authRepo;
  final SecureStorage secureStorage;

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
