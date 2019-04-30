import 'package:dio/dio.dart';
import 'dart:io';
import 'package:jspang_flutter_shop/config/config.dart';
import 'dart:async';

class HttpServices {
  // 请求数据 并返回
  Future request(String requestUrlKey, {Map params}) async {
    try {
      print('请求服务器数据...');
      Response response;
      Dio dio = new Dio();

      // 请求参数返回json数据
      dio.options.responseType = ResponseType.json;
      dio.options.contentType =
          ContentType.parse('application/x-www-form-urlencoded');

      // 判断请求的地址是否存在
      if (requestUrl[requestUrlKey] == null) {
        throw Exception("接口地址不存在");
      }
      // dio 请求数据
      if (params == null) {
        response = await dio.post(requestUrl[requestUrlKey]);
      } else {
        response = await dio.post(requestUrl[requestUrlKey], data: params);
      }
      // 请求成功
      if (response.statusCode == 200) {
        // print("请求结果:" + response.data);
        // 请求成功数据处理
        return response.data.toString();
      } else {
        // 非200状态码处理 # 记录日志 有可能需要弹窗提示
        throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    } catch (e) {
      print('异常');
      print(e);
      return e;
    }
  }
}
