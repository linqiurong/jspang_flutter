import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/routes/application.dart';
import 'package:fluro/fluro.dart';

class FloorContent extends StatelessWidget {
  final List<Floor> floor;
  FloorContent(this.floor);
  final CommonWidgets commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (this.floor.length > 0) {
      return Container(
          width: ScreenUtil().setWidth(750),
          child: Column(
            children: <Widget>[_firstColumn(context), _secondColumn(context)],
          ));
    } else {
      return commonWidgets.requestingData();
    }
  }

  // 第一行左侧
  Widget _firstColumnLeft(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375.0),
      child: InkWell(
        onTap: () {
          Application.router
              .navigateTo(context, "/detail/${this.floor[0].goodsId}");
        },
        child: Image.network("${this.floor[0].image}"),
      ),
    );
  }

  // 第一行右侧
  Widget _firstColumnRight(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () => {
                  Application.router
                      .navigateTo(context, "/detail/${this.floor[1].goodsId}")
                },
            child: Image.network("${this.floor[1].image}"),
          ),
          InkWell(
            onTap: () => {
                  Application.router
                      .navigateTo(context, "/detail/${this.floor[2].goodsId}")
                },
            child: Image.network("${this.floor[2].image}"),
          ),
        ],
      ),
    );
  }

  // 第一行
  Widget _firstColumn(BuildContext context) {
    return Row(
      children: <Widget>[_firstColumnLeft(context), _firstColumnRight(context)],
    );
  }

  Widget _secondColumn(BuildContext context) {
    return Row(
      children: <Widget>[
        _secondColumnItem(context, this.floor[3]),
        _secondColumnItem(context, this.floor[4])
      ],
    );
  }

  Widget _secondColumnItem(BuildContext context, Floor floor) {
    return Container(
      width: ScreenUtil().setWidth(375.0),
      child: InkWell(
        onTap: () => {
              Application.router.navigateTo(context, "/detail/${floor.goodsId}",
                  transition: TransitionType.fadeIn)
            },
        child: Image.network("${floor.image}"),
      ),
    );
  }
}
