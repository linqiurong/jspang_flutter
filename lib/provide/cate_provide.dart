import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/category.dart';
import 'package:jspang_flutter_shop/model/goods_list_model.dart';

class CateProvide with ChangeNotifier {
  // 左侧菜单位置
  int _leftMenuIndex = 0;
  String _leftMenuCategoryID = '';
  // 右侧顶部菜单位置
  int _rightTopNavIndex = 0;
  String _rightTopNavCategoryID = '';

  List<Category> _cateList = [];
  List<BxMallSubDto> _subCateList = [];

  List<Goods> _goodsList = [];
  // 默认为1
  int _catePage = 1;

  // 设置值
  setCateListData(List<Category> cateList) {
    this._cateList = cateList;
    notifyListeners();
  }

  // 设置值
  setGoodsListData(List<Goods> goodsList) {
    this._goodsList.addAll(goodsList);
    notifyListeners();
  }

  List<Goods> getGoodsListData() {
    return this._goodsList;
  }

  // 获取值
  getCateListData() {
    return this._cateList;
  }

  // 设置子菜单
  setSubCateListData(List<BxMallSubDto> subCateListData) {
    this._subCateList = [];
    BxMallSubDto defaultBxMallSubDto = this.getDefaultBxMallSubDto();
    this._subCateList.add(defaultBxMallSubDto);
    this._subCateList.addAll(subCateListData);
    notifyListeners();
  }

  BxMallSubDto getDefaultBxMallSubDto() {
    BxMallSubDto defaultBxMallSubDto = new BxMallSubDto();
    defaultBxMallSubDto.mallCategoryId = '';
    defaultBxMallSubDto.mallSubId = '';
    defaultBxMallSubDto.mallSubName = '全选';
    return defaultBxMallSubDto;
  }

  // 获取子菜单
  List<BxMallSubDto> getSubCateListData() {
    return this._subCateList;
  }

  // 获取子菜单
  List<BxMallSubDto> getSubCateListDataByCateID({@required String cateID}) {
    List<BxMallSubDto> tmpList = [];
    this._cateList.forEach((item) {
      if (item.mallCategoryId == cateID) {
        tmpList = item.bxMallSubDto;
        return;
      }
    });
    return tmpList;
  }

  // 设置左侧顶部菜单位置
  setLeftMenuIndex(int leftMenuIndex) {
    this._leftMenuIndex = leftMenuIndex;
    notifyListeners();
  }

  // 获取左侧顶部菜单位置
  int getLeftMenuIndex() {
    return this._leftMenuIndex;
  }

  // 设置右侧顶部菜单位置
  setRightTopNavIndex(int rightTopNavIndex) {
    this._rightTopNavIndex = rightTopNavIndex;
    notifyListeners();
  }

  // 获取右侧顶部菜单位置
  int getRightTopNavIndex() {
    return this._rightTopNavIndex;
  }

  // 设置左侧顶部菜单位置
  setLeftMenuCategoryID(String categoryID) {
    this._goodsList = [];
    this._leftMenuCategoryID = categoryID;
    notifyListeners();
  }

  // 获取左侧顶部菜单位置
  String getLeftMenuCategoryID() {
    return this._leftMenuCategoryID;
  }

  // 设置右侧顶部菜单位置
  setRightTopNavCategoryID(String categoryID) {
    this._goodsList = [];
    this._rightTopNavCategoryID = categoryID;
    notifyListeners();
  }

  // 获取右侧顶部菜单位置
  getRightTopNavCategoryID() {
    return this._rightTopNavCategoryID;
  }

  // 设置分页值
  setCatePage(page) {
    this._catePage = page;
    notifyListeners();
  }

  // 获取分页值
  int getCatePage() {
    return this._catePage;
  }
}
