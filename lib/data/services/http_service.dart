import 'package:dio/dio.dart';
import 'package:fake_posts/data/utils/const_utils.dart';
import 'package:flutter/foundation.dart';

/// HTTP So'rovlar yuborish uchun service
class HTTPService {
  /// GET so'rovini jo'natish
  ///
  /// [path] - API dagi end point
  Future<Response> get({@required String path}) async {
    return Dio().get(ConstUtils.BASE_URL + path,
        options: Options(headers: {'app-id': ConstUtils.APP_ID}));
  }
}
