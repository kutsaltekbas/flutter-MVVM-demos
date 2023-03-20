import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:parolla_game_mvvm/view/home/model/user_model.dart';

import '../../../core/base/model/base_view_model.dart';
import '../model/comment_model.dart';
import '../model/post_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;
abstract class _HomeViewModelBase with Store, BaseViewModel {

@observable
bool isLoading = false;

@observable
 List<UserModel> userList =[] ;

@observable
 List<PostModel> postList =[] ;

 @observable
 List<CommentModel> commentList =[] ;
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  Future<void> init() async {
    await responseData();
    await responsePosts();
    await responseComment();
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  
  @action
  Future<void> responseData() async {
    final dio = Dio();
    changeIsLoading();
    var response = await dio.get("https://jsonplaceholder.typicode.com/users");
    if(response.statusCode == 200){
      userList = await (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    }
    changeIsLoading();
        
  }

  @action
  Future<void> responsePosts() async {
    final dio = Dio();
    changeIsLoading();
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    if(response.statusCode == 200){
      postList = await (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    }
    changeIsLoading();
        
  }

  @action
  Future<void> responseComment() async {
    final dio = Dio();
    changeIsLoading();
    var response = await dio.get("https://jsonplaceholder.typicode.com/comments");
    if(response.statusCode == 200){
      commentList = await (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
    }
    changeIsLoading();
        
  }

  
}