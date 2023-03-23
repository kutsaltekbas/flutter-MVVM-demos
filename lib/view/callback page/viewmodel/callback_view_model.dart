import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
part 'callback_view_model.g.dart';

class CallBackViewModel = _CallBackViewModelBase with _$CallBackViewModel;
abstract class _CallBackViewModelBase with Store, BaseViewModel {

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