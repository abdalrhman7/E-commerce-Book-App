import '../../../../core/network/api_constants.dart';
import '../../../../core/network/wep_services.dart';
import '../model/login_model.dart';
import '../model/register_mode.dart';

class AuthRepo {
  final WebService webService;

  AuthRepo(this.webService);



  Future<LoginResponse> login(
      {required String email, required String password}) async {
    var response = await webService.postData(
      endPoint: ApiConstants.login,
      data: {'email': email, 'password': password},
    );
    return LoginResponse.fromJson(response.data['data']);
  }


  Future<LoginResponse> register(RegisterRequest registerModel) async {
    var response = await webService.postData(
      endPoint: ApiConstants.register,
      data: registerModel.toJson(),
    );
    return LoginResponse.fromJson(response.data['data']);
  }


  Future<void> logout() async {
    await webService
        .postData(data: {}, endPoint: ApiConstants.logout);
  }
}
