import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
part 'onboard_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewBase with _$OnBoardViewModel;
abstract class _OnBoardViewBase with Store, BaseViewModel {



@observable
bool isLoading = false;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }
}