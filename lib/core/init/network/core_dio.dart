import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:parolla_game_mvvm/core/base/model/base_model.dart';
import 'package:parolla_game_mvvm/core/extension/network_extension.dart';
import 'package:parolla_game_mvvm/core/init/network/ICoreDio.dart';

import '../../constants/enums/http_request_enum.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
  }

  Future<void> fetch2<T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required parseModel,
    Object? data,
    Map<String, dynamic>? queryParameters,
    //CancelToken? cancelToken,
    Options? options,
    //void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await request(path,options: Options(method: type.rawValue));
  
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if(responseBody is List){
          return responseBody.map((e) => parseModel.fromJson(e)).toList();
        }
        // else if(responseBody is Map){
        //   return model.fromJson(responseBody);
        // }
        return responseBody;
      default:
    }
  
  }

  
}
