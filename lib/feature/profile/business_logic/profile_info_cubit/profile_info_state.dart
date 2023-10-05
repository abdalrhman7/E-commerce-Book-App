part of 'profile_info_cubit.dart';

@immutable
abstract class ProfileInfoState {}

class ProfileInfoInitial extends ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoSuccess extends ProfileInfoState {
  final ProfileInfoModel profileInfo;

  ProfileInfoSuccess(this.profileInfo);
}

class ProfileInfoError extends ProfileInfoState {
  final String errMessage;

  ProfileInfoError(this.errMessage);
}
