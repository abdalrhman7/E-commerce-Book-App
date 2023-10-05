import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/local_database/secure_storage.dart';
import '../../date/repo/auth_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.authRepo, this.secureStorage) : super(LogoutInitial());

  final AuthRepo authRepo;
  final SecureStorage secureStorage;

  void logout() async {
    emit(LogoutLoading());
    authRepo.logout().then((value) {
      emit(LogoutSuccess());
      secureStorage.deleteSecureData('token');
    }).catchError((error) {
      emit(LogoutError(error.toString()));
    });
  }
}
