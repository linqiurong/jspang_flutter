import 'package:flutter/material.dart';

class CommonWidgets {
  // 居中显示
  Widget center(title) {
    return Center(
      child: Text(title),
    );
  }

  // 数据请求中
  Widget requestingData() {
    return center('数据请求中...');
  }

  // 未找到相应数据
  Widget requestedNone() {
    return center('未获取到数据...');
  }

  Widget error() {
    return center('系统出错...');
  }
}
