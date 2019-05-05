import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/cate_list_model.dart';
import 'package:jspang_flutter_shop/services/cate_services.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/cate_provide.dart';

class CateLeftMenu extends StatelessWidget {
  // 左侧菜单位置
  List<CateList> _cateList = [];
  CateService _cateServices = new CateService();
  CommonWidgets _commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    // 获取数据
    _cateServices.getCateListData(context);
    // 获取当前点击的数据
    String currentLeftMenuCategoryID =
        _cateServices.cateProvide(context).getLeftMenuCategoryID();
    // 获取分类数据
    this._cateList = _cateServices.cateProvide(context).getCateListData();
    return Provide<CateProvide>(builder: (context, child, value) {
      // 获取分类数据
      this._cateList = _cateServices.cateProvide(context).getCateListData();
      if (this._cateList != null && this._cateList.length > 0) {
        // String defaultCategoryID = this._cateList[0].mallCategoryId;
        // print("defaultCategoryID:" + defaultCategoryID);
        // // 如果第一次加载则给默认值
        // if (currentLeftMenuCategoryID == '') {
        //   // 设置默认为当前第一个分类ID
        // _cateServices
        //     .cateProvide(context)
        //     .setLeftMenuCategoryID(defaultCategoryID);
        //   // 设置默认为当前第一个子分类
        // _cateServices
        //     .cateProvide(context)
        //     .setSubCateListData(this._cateList[0].bxMallSubDto);
        // }
        return Container(
          child: this._menuList(context),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                      width: ScreenUtil().setWidth(1.0),
                      color: Colors.black12))),
        );
      } else {
        return _commonWidgets.requestingData();
      }
    });
  }

  Widget _menuList(context) {
    return Container(
      width: ScreenUtil().setWidth(180.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: this._buldMenuList(context),
      ),
    );
  }

  List<Widget> _buldMenuList(BuildContext context) {
    List<Widget> widgetList = [];
    String currentCategoryID =
        _cateServices.cateProvide(context).getLeftMenuCategoryID();
    this._cateList.forEach((item) {
      return widgetList.add(_menuItem(context, item, currentCategoryID));
    });

    return widgetList;
  }

  // 菜单单项
  Widget _menuItem(
      BuildContext context, CateList item, String currentCategoryID) {
    return InkWell(
      onTap: () {
        // 设置当前分类ID
        _cateServices
            .cateProvide(context)
            .setLeftMenuCategoryID(item.mallCategoryId);
        // 设置当前分类的子分类
        _cateServices
            .cateProvide(context)
            .setSubCateListData(item.bxMallSubDto);
        // 设置为空
        _cateServices.cateProvide(context).setRightTopNavCategoryID("");
        // 设置为1
        _cateServices.cateProvide(context).setCatePage(1);
        // 获取当前点击分类下的商品列表
        _cateServices.getGoodsListData(context);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(8.0, 14.0, 14.0, 8.0),
        child: Text(item.mallCategoryName),
        decoration: BoxDecoration(
            color: currentCategoryID == item.mallCategoryId
                ? Colors.black12
                : Colors.white,
            border: Border(
                bottom: BorderSide(
                    color: Colors.black12, width: ScreenUtil().setWidth(1.0)))),
      ),
    );
  }
}
