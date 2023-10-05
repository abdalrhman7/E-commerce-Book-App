import 'package:bloc/bloc.dart';
import 'package:book_store/feature/profile/data/model/profile_info.dart';
import 'package:meta/meta.dart';

import '../../data/repo/profile_repo.dart';

part 'profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit(this.accountRepo)
      : super(ProfileInfoInitial());

  final ProfileRepo accountRepo;

  Future<void> getProfileInfo() async {
    emit(ProfileInfoLoading());
    await accountRepo
        .getProfileInfo()
        .then((value) => emit(ProfileInfoSuccess(value)))
        .catchError((onError) {
      emit(ProfileInfoError(onError.toString()));
    });
  }
}
