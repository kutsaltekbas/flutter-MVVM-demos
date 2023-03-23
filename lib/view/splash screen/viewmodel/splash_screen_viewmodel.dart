import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:parolla_game_mvvm/core/constants/enums/locale_keys_enum.dart';
import 'package:parolla_game_mvvm/core/init/cache/locale_manager.dart';
import 'package:parolla_game_mvvm/view/authenticate/login/view/login_view.dart';
import 'package:parolla_game_mvvm/view/home/view/home_view.dart';

import '../../../core/base/model/base_view_model.dart';
part 'splash_screen_viewmodel.g.dart';

class SplashScreenViewmodel = _SplashScreenViewmodelBase
    with _$SplashScreenViewmodel;

abstract class _SplashScreenViewmodelBase with Store, BaseViewModel {
  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  Future<void> init() async {
    pushView();
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> pushView() async {
    await Future.delayed(Duration(seconds: 3));
    if (LocaleManager.instance.getBoolValue(PreferencesKeys.TOKEN) == true) {
      Navigator.pushReplacement(
          viewModelContext,
          MaterialPageRoute(
              builder: (viewModelContext) => HomeView(
                  userId: LocaleManager.instance
                      .getStringValue(PreferencesKeys.TOKEN))));
    } else if (LocaleManager.instance.getBoolValue(PreferencesKeys.TOKEN) ==
        false) {
      Navigator.pushReplacement(viewModelContext,
          MaterialPageRoute(builder: (viewModelContext) => LoginView()));
    } else {
      await LocaleManager.instance.setBoolValue(PreferencesKeys.TOKEN, false);
      Navigator.pushReplacement(viewModelContext,
          MaterialPageRoute(builder: (viewModelContext) => LoginView()));
    }
  }
}
