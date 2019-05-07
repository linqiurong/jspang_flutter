import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/pages/cate_page/cate_left_menu.1.dart';
import 'package:jspang_flutter_shop/pages/cate_page/cate_right_top_nav.1.dart';
import 'package:jspang_flutter_shop/pages/cate_page/cate_right_content.dart';
import 'package:jspang_flutter_shop/model/category.dart';
import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/cate_provide.dart';
import 'package:jspang_flutter_shop/services/cate_services.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class CatePage extends StatelessWidget {
  CateService _cateServices = new CateService();
  CommonWidgets _commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    _cateServices.getCateListData(context);
    return Provide<CateProvide>(
      builder: (context, child, val) {
        List<Category> category =
            _cateServices.cateProvide(context).getCateListData();
        if (category != null) {
          String cateID =
              _cateServices.cateProvide(context).getLeftMenuCategoryID();
          List<BxMallSubDto> subCategory = _cateServices
              .cateProvide(context)
              .getSubCateListDataByCateID(cateID: cateID);
          if (subCategory != null && category != null) {
            return Container(
                child: Row(
              children: <Widget>[
                CateLeftMenu(category),
                Column(
                  children: <Widget>[
                    CateRightTopNav(subCategory),
                    CateRightContent()
                  ],
                )
              ],
            ));
          } else {
            return _commonWidgets.requestedNone();
          }
        } else {
          return _commonWidgets.requestingData();
        }
      },
    );
  }
}
