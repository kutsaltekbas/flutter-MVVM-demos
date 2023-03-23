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
    await pushView();
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> pushView() async {
    print(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN));
    await Future.delayed(Duration(seconds: 1));
    if (LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN) != '') {
      print(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN));
      Navigator.pushReplacement(
          viewModelContext,
          MaterialPageRoute(
              builder: (viewModelContext) => HomeView(
                  userId: LocaleManager.instance
                      .getStringValue(PreferencesKeys.TOKEN))));
    } else {
      Navigator.pushReplacement(viewModelContext,
          MaterialPageRoute(builder: (viewModelContext) => LoginView()));
    }
  }
}
