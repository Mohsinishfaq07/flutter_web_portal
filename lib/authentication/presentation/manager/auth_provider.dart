import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_portal/authentication/data/models/login_response_model.dart';

import '../../../dashboard/presentation/widgets/routes.dart';
import '../../../failure.dart';
import '../../../show_snack_bar.dart';
import '../../data/models/login-request_model.dart';
import '../../domain/use_cases/login_use_case.dart';

class AuthProvider extends ChangeNotifier{
  AuthProvider(this._loginUseCase);
  //usecases
  LoginUseCase _loginUseCase;
  //responseModel
  LoginResponseModel? loginResponseModel;

  //valueNotifiers
  ValueNotifier<bool> loginLoading = ValueNotifier(false);

  //useCases calls
  Future<void> loginUser( String email, password) async {

      loginLoading.value = false;

      final params = LoginRequestModel(email: email, password: password);
      var loginEither = await _loginUseCase(params);
      if(loginEither.isLeft()){
        handleError(loginEither);
        loginLoading.value = false;

      }
      else if(loginEither.isRight()) {
        loginEither.foldRight(null, (response ,pr) {
          loginResponseModel =response;
          print(response.toJson());
          loginLoading.value= false;
          notifyListeners();
          // response =loginResponseModel.toJson();


        });

      }

      // loginEither.fold(
      //       (error) {
      //     handleError(loginEither);
      //     loginLoading.value = false;
      //   },
      //       (response) {
      //     loginResponseModel = response;
      //     Navigator.pushReplacementNamed( Routes.ADMIN_PAGE);
      //     loginLoading.value = false;
      //   },
      // );

      // handleError(loginEither);
      // loginLoading.value = false;

  }

  void handleError(Either<Failure, dynamic> either) {
    either.fold((l)=> ShowSnackBar.show(l.message),(r)=> null);
  }


}