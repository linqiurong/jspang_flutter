import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/routes/application.dart';
import 'package:fluro/fluro.dart';

class HomeGoodsRecommend extends StatelessWidget {
  // 商品列表
  List<Recommend> _goodsRecommendList = [];

  HomeGoodsRecommend(this._goodsRecommendList);

  CommonWidgets _commonWidgets = new CommonWidgets();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _title(),
          Row(children: this._buildGoodsList(context))
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
      child: Text("商品推荐",
          style: TextStyle(
              color: Colors.pink, fontSize: ScreenUtil().setSp(28.0))),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: ScreenUtil().setSp(1.0), color: Colors.black12))),
    );
  }

  // 推荐商品列表
  List<Widget> _buildGoodsList(BuildContext context) {
    List<Widget> tmpRecommendList = [];
    this._goodsRecommendList.forEach((item) {
      tmpRecommendList.add(this._goodsRecommendItem(context, item));
    });
    return tmpRecommendList;
  }

  // 推荐商品的每一项
  Widget _goodsRecommendItem(BuildContext context, Recommend item) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, "/detail/${item.goodsId}",
            transition: TransitionType.fadeIn);
      },
      child: Container(
        padding: EdgeInsets.all(3.0),
        width: ScreenUtil().setWidth(250.0),
        child: Column(
          children: <Widget>[
            Image.network(item.image),
            Text(
              "￥${item.mallPrice}",
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(28),
              ),
            ),
            Text(
              "￥${item.price}",
              style: TextStyle(
                  color: Colors.black12,
                  fontSize: ScreenUtil().setSp(20),
                  decoration: TextDecoration.lineThrough),
            )
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    width: ScreenUtil().setSp(1.0), color: Colors.black12))),
      ),
    );
  }
}
