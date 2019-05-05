import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:jspang_flutter_shop/routes/application.dart';

class HomeCate extends StatelessWidget {
  List<Category> _categoryList = [];
  HomeCate(this._categoryList);

  CommonWidgets _commonWidgets = new CommonWidgets();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5.0),
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: _cateList(context),
    );
  }

  Widget _cateList(BuildContext context) {
    if (_categoryList.length > 0) {
      if (_categoryList.length > 10)
        _categoryList.removeRange(11, _categoryList.length);
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
      onTap: () => {
            // Application.router
            //     .navigateTo(context, '/detail/${category.mallCategoryId}')
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
