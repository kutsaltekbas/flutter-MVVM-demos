// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$jsonStringAtom =
      Atom(name: '_HomeViewModelBase.jsonString', context: context);

  @override
  List<String> get jsonString {
    _$jsonStringAtom.reportRead();
    return super.jsonString;
  }

  @override
  set jsonString(List<String> value) {
    _$jsonStringAtom.reportWrite(value, super.jsonString, () {
      super.jsonString = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeViewModelBase.isLoading', context: context);

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

  late final _$userListAtom =
      Atom(name: '_HomeViewModelBase.userList', context: context);

  @override
  List<UserModel> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<UserModel> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$postListAtom =
      Atom(name: '_HomeViewModelBase.postList', context: context);

  @override
  List<PostModel> get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(List<PostModel> value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  late final _$commentListAtom =
      Atom(name: '_HomeViewModelBase.commentList', context: context);

  @override
  List<CommentModel> get commentList {
    _$commentListAtom.reportRead();
    return super.commentList;
  }

  @override
  set commentList(List<CommentModel> value) {
    _$commentListAtom.reportWrite(value, super.commentList, () {
      super.commentList = value;
    });
  }

  late final _$dropDownIndexAtom =
      Atom(name: '_HomeViewModelBase.dropDownIndex', context: context);

  @override
  int get dropDownIndex {
    _$dropDownIndexAtom.reportRead();
    return super.dropDownIndex;
  }

  @override
  set dropDownIndex(int value) {
    _$dropDownIndexAtom.reportWrite(value, super.dropDownIndex, () {
      super.dropDownIndex = value;
    });
  }

  late final _$postIndexAtom =
      Atom(name: '_HomeViewModelBase.postIndex', context: context);

  @override
  int get postIndex {
    _$postIndexAtom.reportRead();
    return super.postIndex;
  }

  @override
  set postIndex(int value) {
    _$postIndexAtom.reportWrite(value, super.postIndex, () {
      super.postIndex = value;
    });
  }

  late final _$filteredCommentListAtom =
      Atom(name: '_HomeViewModelBase.filteredCommentList', context: context);

  @override
  List<CommentModel> get filteredCommentList {
    _$filteredCommentListAtom.reportRead();
    return super.filteredCommentList;
  }

  @override
  set filteredCommentList(List<CommentModel> value) {
    _$filteredCommentListAtom.reportWrite(value, super.filteredCommentList, () {
      super.filteredCommentList = value;
    });
  }

  late final _$filteredPostListAtom =
      Atom(name: '_HomeViewModelBase.filteredPostList', context: context);

  @override
  List<PostModel> get filteredPostList {
    _$filteredPostListAtom.reportRead();
    return super.filteredPostList;
  }

  @override
  set filteredPostList(List<PostModel> value) {
    _$filteredPostListAtom.reportWrite(value, super.filteredPostList, () {
      super.filteredPostList = value;
    });
  }

  late final _$dropDownItemsAtom =
      Atom(name: '_HomeViewModelBase.dropDownItems', context: context);

  @override
  List<int> get dropDownItems {
    _$dropDownItemsAtom.reportRead();
    return super.dropDownItems;
  }

  @override
  set dropDownItems(List<int> value) {
    _$dropDownItemsAtom.reportWrite(value, super.dropDownItems, () {
      super.dropDownItems = value;
    });
  }

  late final _$filterPostsAsyncAction =
      AsyncAction('_HomeViewModelBase.filterPosts', context: context);

  @override
  Future<void> filterPosts() {
    return _$filterPostsAsyncAction.run(() => super.filterPosts());
  }

  late final _$addDropDownItemsAsyncAction =
      AsyncAction('_HomeViewModelBase.addDropDownItems', context: context);

  @override
  Future<void> addDropDownItems() {
    return _$addDropDownItemsAsyncAction.run(() => super.addDropDownItems());
  }

  late final _$responseDataAsyncAction =
      AsyncAction('_HomeViewModelBase.responseData', context: context);

  @override
  Future<void> responseData() {
    return _$responseDataAsyncAction.run(() => super.responseData());
  }

  late final _$responsePostsAsyncAction =
      AsyncAction('_HomeViewModelBase.responsePosts', context: context);

  @override
  Future<void> responsePosts() {
    return _$responsePostsAsyncAction.run(() => super.responsePosts());
  }

  late final _$responseCommentAsyncAction =
      AsyncAction('_HomeViewModelBase.responseComment', context: context);

  @override
  Future<void> responseComment() {
    return _$responseCommentAsyncAction.run(() => super.responseComment());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void changeDropdown(int? value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeDropdown');
    try {
      return super.changeDropdown(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterComments() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.filterComments');
    try {
      return super.filterComments();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
jsonString: ${jsonString},
isLoading: ${isLoading},
userList: ${userList},
postList: ${postList},
commentList: ${commentList},
dropDownIndex: ${dropDownIndex},
postIndex: ${postIndex},
filteredCommentList: ${filteredCommentList},
filteredPostList: ${filteredPostList},
dropDownItems: ${dropDownItems}
    ''';
  }
}
