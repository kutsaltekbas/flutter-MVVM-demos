import 'package:dio/dio.dart';

import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';

abstract class ICoreDio{
  Future<void> fetch2<T extends BaseModel>(
    String path, {
    required parseModel,

    required HttpTypes type,
    Object? data,
    Map<String, dynamic>? queryParameters,
    //CancelToken? cancelToken,
    Options? options,
    //void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  });
}