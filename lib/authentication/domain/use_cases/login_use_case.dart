
import 'package:dartz/dartz.dart';

import '../../../failure.dart';
import '../../../usecase.dart';
import '../../data/models/login-request_model.dart';
import '../../data/models/login_response_model.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends UseCase <LoginResponseModel, LoginRequestModel> {
  AuthRepository repository;
  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(LoginRequestModel params) async {
    return await repository.loginUser(params);
  }
}