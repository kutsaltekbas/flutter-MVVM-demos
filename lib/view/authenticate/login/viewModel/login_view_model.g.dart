// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_LoginViewModelBase.isLoading', context: context);

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

  late final _$isSignedInAtom =
      Atom(name: '_LoginViewModelBase.isSignedIn', context: context);

  @override
  bool get isSignedIn {
    _$isSignedInAtom.reportRead();
    return super.isSignedIn;
  }

  @override
  set isSignedIn(bool value) {
    _$isSignedInAtom.reportWrite(value, super.isSignedIn, () {
      super.isSignedIn = value;
    });
  }

  late final _$isSignedOutAtom =
      Atom(name: '_LoginViewModelBase.isSignedOut', context: context);

  @override
  bool get isSignedOut {
    _$isSignedOutAtom.reportRead();
    return super.isSignedOut;
  }

  @override
  set isSignedOut(bool value) {
    _$isSignedOutAtom.reportWrite(value, super.isSignedOut, () {
      super.isSignedOut = value;
    });
  }

  late final _$userIdAtom =
      Atom(name: '_LoginViewModelBase.userId', context: context);

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$loginDropdownItemsAtom =
      Atom(name: '_LoginViewModelBase.loginDropdownItems', context: context);

  @override
  List<DropdownMenuItem<Locale>> get loginDropdownItems {
    _$loginDropdownItemsAtom.reportRead();
    return super.loginDropdownItems;
  }

  @override
  set loginDropdownItems(List<DropdownMenuItem<Locale>> value) {
    _$loginDropdownItemsAtom.reportWrite(value, super.loginDropdownItems, () {
      super.loginDropdownItems = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_LoginViewModelBase.signIn', context: context);

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  late final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase', context: context);

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSignedIn: ${isSignedIn},
isSignedOut: ${isSignedOut},
userId: ${userId},
loginDropdownItems: ${loginDropdownItems}
    ''';
  }
}
