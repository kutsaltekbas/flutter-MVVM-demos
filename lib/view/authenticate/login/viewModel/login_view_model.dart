import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:parolla_game_mvvm/core/base/model/base_view_model.dart';
import 'package:parolla_game_mvvm/view/authenticate/login/service/firebase_service.dart';
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