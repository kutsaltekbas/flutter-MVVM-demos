// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashScreenViewmodel on _SplashScreenViewmodelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SplashScreenViewmodelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$pushViewAsyncAction =
      AsyncAction('_SplashScreenViewmodelBase.pushView', context: context);

  @override
  Future<void> pushView() {
    return _$pushViewAsyncAction.run(() => super.pushView());
  }

  late final _$_SplashScreenViewmodelBaseActionController =
      ActionController(name: '_SplashScreenViewmodelBase', context: context);

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_SplashScreenViewmodelBaseActionController
        .startAction(name: '_SplashScreenViewmodelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_SplashScreenViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
