
import 'package:dartz/dartz.dart';

import '../../../failure.dart';
import '../../data/models/login-request_model.dart';
import '../../data/models/login_response_model.dart';

abstract class AuthRepository {

  Future<Either<Failure, LoginResponseModel>> loginUser(LoginRequestModel params);


}
