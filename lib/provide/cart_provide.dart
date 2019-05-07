import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvide with ChangeNotifier {
  int _totalGoodsNumber = 0;
  double _totalGoodsPrice = 0.0;

  List<CartGoodsModel> _cartGoodsList = [];

  _setCartGoodsList(List<CartGoodsModel> _cartGoodsList) {
    this._cartGoodsList = _cartGoodsList;
    notifyListeners();
  }

  List<CartGoodsModel> getCartGoodsAllList() {
    return this._cartGoodsList;
  }

  int getTotalGoodsNumber() {
    return this._totalGoodsNumber;
  }

  setTotalGoodsNumber(int number) {
    this._totalGoodsNumber = number;
    notifyListeners();
  }

  double getTotalGoodsPrice() {
    return this._totalGoodsPrice;
  }

  setTotalGoodsPrice(double price) {
    this._totalGoodsPrice = price;
    notifyListeners();
  }

  bool _checkAll = true;

  setCheckAll(bool checked) {
    this._checkAll = checked;
    notifyListeners();
  }

  getCheckAll() {
    return this._checkAll;
  }

  CartGoodsModel _tmp;
  // 设置购物车列表
  setCartGoodsList(CartGoodsModel cartGoods, BuildContext context) async {
    //print("设置购物车列表");
    // print("新加入:" + cartGoods.toJson().toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (cartGoods != null) {
      // 获取数据
      await this.getCartGoodsList().then((responseData) {
        //
        this._setData(responseData, cartGoods);
      });
      await prefs.setString(
          'cartGoodsList', jsonEncode(this._cartGoodsList).toString());
      // 设置成功后 再获取一次
    } else {
      print("cartGoods 为空 不进行操作");
    }

    await this.getCartGoodsList();
    // print("购物车商品列表:" + jsonEncode(tmpCartGoodsList).toString());
  }

  _setData(responseData, cartGoods) {
    List<CartGoodsModel> tmpCartGoodsList = [];
    bool _hasGoods = false;
    if (responseData != null) {
      var tmpResponseData = (jsonDecode(responseData) as List);
      // 判断之前是否有数据 如果有则添加到列表里
      if (tmpResponseData != null && tmpResponseData.length > 0) {
        // 购物车商品列表

        // 循环所有数据
        tmpResponseData.forEach((item) {
          _tmp = CartGoodsModel.fromJson(item);
          // 如果存在则获取当前位置
          if (_tmp.goodsID == cartGoods.goodsID) {
            _hasGoods = true;
            _tmp.goodsNumber += 1;
          }
          tmpCartGoodsList.add(_tmp);
        });
      }
      // print("hasGoods:" + _hasGoods.toString());
      // 数据列表不存在则直接添加 已存在则数量加1
      if (_hasGoods == false) {
        tmpCartGoodsList.add(cartGoods);
      }
      this._cartGoodsList = tmpCartGoodsList;
      // print("长度:" + tmpCartGoodsList.length.toString());
      // 设置值
      this._setCartGoodsList(tmpCartGoodsList);
    }
  }

  clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("cartGoodsList", null);
  }

  // 获取购物车商品数据
  Future getCartGoodsList() async {
    this._cartGoodsList = [];
    this._totalGoodsNumber = 0;
    this._totalGoodsPrice = 0.0;
    // 获取数据
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartGoodsListStr = prefs.getString('cartGoodsList');
    _getCartGoodsList(cartGoodsListStr);
    return cartGoodsListStr;
  }

  // 默认全选
  bool tmpCheckAll = true;
  // 获取并统计数量与价格
  _getCartGoodsList(String cartGoodsListStr) {
    if (cartGoodsListStr != null) {
      List tmpResponseDataList = (jsonDecode(cartGoodsListStr) as List);

      // 判断之前是否有数据 如果有则添加到列表里
      if (tmpResponseDataList != null && tmpResponseDataList.length > 0) {
        // 循环所有数据
        tmpResponseDataList.forEach((item) {
          _tmp = CartGoodsModel.fromJson(item);
          _cartGoodsList.add(_tmp);

          if (_tmp.isChecked == true) {
            this._totalGoodsNumber += _tmp.goodsNumber;
            this._totalGoodsPrice += _tmp.goodsNumber * _tmp.presentPrice;
          } else {
            // 如果有一个未全选则设置为false
            tmpCheckAll = false;
          }
        });
      }
    }
    this._checkAll = tmpCheckAll;
    this.setCheckAll(tmpCheckAll);
    // 设置值
    this._setCartGoodsList(_cartGoodsList);
    this.setTotalGoodsNumber(this._totalGoodsNumber);
    this.setTotalGoodsPrice(this._totalGoodsPrice);
  }

  //
  change(
    String goodsID, [
    bool isChecked = false,
    bool isReduce = false,
    bool checkAllClicked = false,
    bool isDelete = false,
  ]) async {
    String cartGoodsListStr;

    await getCartGoodsList().then((val) {
      cartGoodsListStr = val;
    });
    List<CartGoodsModel> cartGoodsList = [];

    int deleteIndex = -1;
    if (cartGoodsListStr != null) {
      List tmpResponseDataList = (jsonDecode(cartGoodsListStr) as List);
      // 判断之前是否有数据 如果有则添加到列表里
      if (tmpResponseDataList != null && tmpResponseDataList.length > 0) {
        // 循环所有数据
        tmpResponseDataList.forEach((item) {
          //
          _tmp = CartGoodsModel.fromJson(item);
          if (checkAllClicked == true) {
            tmpCheckAll = true;
            _tmp.isChecked = !this.getCheckAll();
          } else if (goodsID == _tmp.goodsID) {
            // 判断是否需要删除
            deleteIndex =
                isDelete ? tmpResponseDataList.indexOf(item) : deleteIndex;

            // 如果是选中与不选中
            if (isChecked == true) _tmp.isChecked = !_tmp.isChecked;
            // print("点击后的状态:" + isChecked.toString());
            // 如果是数量的增减
            if (isChecked == false && isReduce == true && _tmp.goodsNumber > 1)
              _tmp.goodsNumber -= 1;
            if (isChecked == false && isReduce == false) _tmp.goodsNumber += 1;
          }
          cartGoodsList.add(_tmp);
        });
      }
    }
    // 删除
    if (deleteIndex != -1 && isDelete == true && cartGoodsList.length > 0)
      cartGoodsList.removeAt(deleteIndex);

    // 设置值
    this._setCartGoodsList(cartGoodsList);
    // 重新写入缓存
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        "cartGoodsList", jsonEncode(cartGoodsList).toString());

    await this.getCartGoodsList();
  }
}
