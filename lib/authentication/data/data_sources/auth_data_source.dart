import 'dart:async';

import 'package:dio/dio.dart';

import '../../../app_messages.dart';
import '../../../app_url.dart';
import '../../../error_response_model.dart';
import '../../../failure.dart';
import '../models/login-request_model.dart';
import '../models/login_response_model.dart';

abstract class AuthRemoteDataSource{Future<LoginResponseModel> loginUser(LoginRequestModel params);
}
class AuthRemoteDataSourceImp implements AuthRemoteDataSource{
  Dio dio;
  AuthRemoteDataSourceImp({required this.dio});

  @override
  Future<LoginResponseModel> loginUser(LoginRequestModel params) async {
    String url = AppUrl.baseUrl + AppUrl.login;

    try {
      final response = await dio.post(url, data: params.toJson());

      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      }

      throw  const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      // Logger().v(exception.response!.statusCode);
      if (exception.type == DioExceptionType.connectionTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
        ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e);
    }
  }

}