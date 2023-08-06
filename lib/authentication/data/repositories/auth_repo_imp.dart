import 'package:dartz/dartz.dart';
import 'package:web_portal/authentication/data/models/login-request_model.dart';
import 'package:web_portal/authentication/data/models/login_response_model.dart';
import 'package:web_portal/authentication/domain/repositories/auth_repository.dart';
import 'package:web_portal/failure.dart';

import '../../../app_messages.dart';
import '../../../network.info.dart';
import '../data_sources/auth_data_source.dart';

class AuthRepoImp implements AuthRepository {
  final NetworkInfo networkInfo;

  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImp({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, LoginResponseModel>> loginUser(
      LoginRequestModel params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.loginUser(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
