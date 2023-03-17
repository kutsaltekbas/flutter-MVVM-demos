import 'dart:html';

import 'package:dio/dio.dart';
import 'package:parolla_game_mvvm/core/base/model/base_error.dart';
import 'package:parolla_game_mvvm/core/base/model/base_model.dart';
import 'package:parolla_game_mvvm/core/constants/enums/locale_keys_enum.dart';
import 'package:parolla_game_mvvm/core/init/cache/locale_manager.dart';
import 'package:parolla_game_mvvm/core/init/network/ICoreDio.dart';

import 'core_dio.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();

  static NetworkManager get instance => _instance;

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        headers: {
          "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
        });

    _dio = Dio(baseOptions);
    coreDio = CoreDio(baseOptions);
    _dio!.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {},
      onRequest: (options, handler) {
        options.path += "veli";
      },
      onResponse: (e, handler) {},
    ));
  }

  Dio? _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio!.get(path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        }
        // else if(responseBody is Map){
        //   return model.fromJson(responseBody);
        // }
        return responseBody;
      default:
    }
  }
}
