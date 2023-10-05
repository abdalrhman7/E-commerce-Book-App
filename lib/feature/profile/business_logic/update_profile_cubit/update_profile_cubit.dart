import 'package:bloc/bloc.dart';
import 'package:book_store/feature/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

import '../../data/model/profile_info.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.accountRepo) : super(UpdateProfileInitial());

  final ProfileRepo accountRepo;


  void updateUserInfo(ProfileInfoModel registerModel) async{
    emit(UpdateProfileLoading());
    accountRepo
        .updateUserProfile(registerModel )
        .then((_) => emit(UpdateProfileSuccess()))
        .catchError((error) => emit(UpdateProfileError(error.toString())));
  }
}
