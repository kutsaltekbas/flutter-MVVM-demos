import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:parolla_game_mvvm/core/extension/context_extension.dart';
import 'package:parolla_game_mvvm/view/home/model/user_model.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../callback page/view/callback_view.dart';
import '../model/comment_model.dart';
import '../model/post_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @observable
  List<String> jsonString = [];

  @observable
  bool isLoading = false;

  @observable
  List<UserModel> userList = [];

  @observable
  List<PostModel> postList = [];

  @observable
  List<CommentModel> commentList = [];

  @observable
  int dropDownIndex = 1;
  @action
  void changeDropdown(int? value) {
    dropDownIndex = value!;
    postIndex = value;
    filterPosts();
  }

  @observable
  int postIndex = 1;
  @observable
  List<CommentModel> filteredCommentList = [];
  @observable
  List<PostModel> filteredPostList = [];
  @action
  Future<void> filterPosts() async {
    filteredPostList =
        postList.where((element) => element.userId == (postIndex)).toList();
  }

  @observable
  List<int> dropDownItems = [];

  @action
  Future<void> addDropDownItems() async {
    if (dropDownItems.isEmpty) {
      dropDownItems.add(0);
    }
    for (int i = 0; i < postList.length; i++) {
      if (dropDownItems.contains(postList[i].userId) == false) {
        dropDownItems.add(postList[i].userId!.toInt());
      }
      ;
    }
  }

  @action
  void filterComments() {
    filteredCommentList = commentList
        .where(
            (element) => element.postId == filteredPostList[postIndex - 1].id)
        .toList();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  Future<void> init() async {
    changeIsLoading();

    await responseData();
    await responsePosts();
    await responseComment();
    await addDropDownItems();
    changeIsLoading();
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> responseData() async {
    final dio = Dio();
    //changeIsLoading();
    var response = await dio.get("https://jsonplaceholder.typicode.com/users");
    if (response.statusCode == 200) {
      userList = await (response.data as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    }
    // changeIsLoading();
  }

  @action
  Future<void> responsePosts() async {
    final dio = Dio();
    //changeIsLoading();
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      postList = (response.data as List)
          .map((e) => PostModel.fromJson(e))
          .toList();
      filteredPostList = postList;
    }
    //inspect(postList);
    //changeIsLoading();
  }

  @action
  Future<void> responseComment() async {
    final dio = Dio();
    //changeIsLoading();
    var response =
        await dio.get("https://jsonplaceholder.typicode.com/comments");
    if (response.statusCode == 200) {
      commentList = await (response.data as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
      filteredCommentList = commentList;
    }
    // changeIsLoading();
  }

  @action
  void pushCallBackPage(){
    Navigator.push(viewModelContext, MaterialPageRoute(builder: (viewModelContext)=>CallBackView(callbackFunc: callbackFunc,)));
  }

  @observable
  int callbackVariable = 0;

  @action
  void callbackFunc(){
    callbackVariable++;
  }
}
