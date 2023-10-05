import 'package:book_store/core/network/api_constants.dart';
import 'package:book_store/core/network/wep_services.dart';
import 'package:dio/dio.dart';

import '../model/profile_info.dart';

class ProfileRepo {
  final WebService webService;

  ProfileRepo(this.webService);

  Future<ProfileInfoModel> getProfileInfo() async {
    final Response response = await webService.getData(
        endPoint: ApiConstants.profileInfo, data: {});
    return ProfileInfoModel.fromJson(response.data['data']);
  }

  Future<void> updateUserProfile(ProfileInfoModel registerModel) async {
    await webService.postData(
        endPoint: ApiConstants.updateProfile,
        data: registerModel.toJson(),
    );
  }
}
