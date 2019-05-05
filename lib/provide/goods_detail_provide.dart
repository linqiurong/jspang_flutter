import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/goods_detail_model.dart';

class GoodsDetailProvide with ChangeNotifier {
  String _goodsId = '';

  Detail _goodsDetail = null;

  int _tabIndex = 0;

  setGoodsDetail(Detail data) {
    this._goodsDetail = data;
    notifyListeners();
  }

  Detail getGoodsDetail() {
    return this._goodsDetail;
  }

  setGoodsId(String goodsId) {
    this._goodsId = goodsId;
    notifyListeners();
  }

  getGoodsId() {
    return this._goodsId;
  }

  setTabIndex(int index) {
    this._tabIndex = index;
    notifyListeners();
  }

  getTabIndex() {
    return this._tabIndex;
  }
}
