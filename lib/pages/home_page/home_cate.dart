import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class HomeCate extends StatelessWidget {
  List<Category> categoryList = [];
  HomeCate(this.categoryList);

  CommonWidgets commonWidgets = new CommonWidgets();

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
    if (categoryList.length > 0) {
      if (categoryList.length > 10)
        categoryList.removeRange(11, categoryList.length);
      return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: _buildChildren(),
      );
    } else {
      return commonWidgets.requestingData();
    }
  }

  // 生成
  List<Widget> _buildChildren() {
    List<Widget> tmpWidgetList = [];
    this.categoryList.forEach((item) {
      tmpWidgetList.add(_cateItem(item));
    });
    return tmpWidgetList;
  }

  Widget _cateItem(Category category) {
    return InkWell(
      onTap: () => {},
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
