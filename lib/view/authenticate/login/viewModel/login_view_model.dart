import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:parolla_game_mvvm/core/base/model/base_view_model.dart';
import 'package:parolla_game_mvvm/view/home/view/home_view.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @observable
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @observable
  bool isSignedIn = false;
  @observable
  bool isSignedOut = false;
  @action
  Future<void> signIn(BuildContext context) async {
    final dio = Dio();
    var response = await dio.post(
        "https://online-test.cimsa.com.tr/service/account/v1/Login",
        data: {
          "email": "${emailController.text}",
          "password": "${passwordController.text}"
        },
        options: Options(headers: {"language": "T"}));
    if (response.data["status"] == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(
              userId: response.data["data"]["id"].toString(),
            ),
          ));
    }
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

//   @action
//   Future<void> signIn(String email,String password) async {
//     changeIsLoading();
//     await FirebaseServices.instance.loginFirebase(email, password,);
//     if(FirebaseServices.instance.userSignIn){
//       isSignedIn = true;
//   }
//     changeIsLoading();
// }
}
