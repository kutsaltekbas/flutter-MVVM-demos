import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:parolla_game_mvvm/core/base/model/base_view_model.dart';
import 'package:parolla_game_mvvm/core/constants/enums/locale_keys_enum.dart';
import 'package:parolla_game_mvvm/core/init/cache/locale_manager.dart';
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

  @observable
  String userId = "";
  @action
  Future<void> signIn() async {
    final dio = Dio();
    var response = await dio.post(
        "https://online-test.cimsa.com.tr/service/account/v1/Login",
        data: {
          "email": "${emailController.text}",
          "password": "${passwordController.text}"
        },
        options: Options(headers: {"language": "T"}));
    if (response.data["status"] == true) {
      userId = response.data["data"]["id"].toString();
      await LocaleManager.instance
          .setStringValue(PreferencesKeys.TOKEN, userId);
      print(response.toString());
      Navigator.pushReplacement(
          viewModelContext,
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
