import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/category.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:jspang_flutter_shop/services/cate_services.dart';
import 'package:jspang_flutter_shop/services/home_services.dart';

class HomeCate extends StatelessWidget {
  final List<Category> _categoryList;
  HomeCate(this._categoryList);

  final CommonWidgets _commonWidgets = new CommonWidgets();

  final CateService _cateServices = new CateService();
  final HomeService _homeService = new HomeService();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5.0),
      height: ScreenUtil().setHeight(260),
      padding: EdgeInsets.all(3.0),
      child: _cateList(context),
    );
  }

  Widget _cateList(BuildContext context) {
    if (_categoryList.length > 0) {
      return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: _buildChildren(context),
      );
    } else {
      return _commonWidgets.requestingData();
    }
  }

  // 生成
  List<Widget> _buildChildren(BuildContext context) {
    List<Widget> tmpWidgetList = [];
    this._categoryList.forEach((item) {
      tmpWidgetList.add(_cateItem(context, item));
    });
    return tmpWidgetList;
  }

  Widget _cateItem(BuildContext context, Category category) {
    return InkWell(
      onTap: () {
        // List<BxMallSubDto> subCateListData = category.bxMallSubDto;
        print("首页点击分类ID:" + category.mallCategoryId.toString());
        // 设置值
        _cateServices
            .cateProvide(context)
            .setLeftMenuCategoryID(category.mallCategoryId);
        // 设置子菜单
        _cateServices.cateProvide(context).setRightTopNavCategoryID('');
        // 设置子菜单
        _cateServices
            .cateProvide(context)
            .setSubCateListData(category.bxMallSubDto);
        // 获取数据
        _cateServices.getGoodsListData(context);
        // 切换
        _homeService.homeProvide(context).setBottonIndex(1);
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Image.network(
              category.image,
              width: ScreenUtil().setWidth(95),
            ),
            Text(category.mallCategoryName)
          ],
        ),
      ),
    );
  }
}
