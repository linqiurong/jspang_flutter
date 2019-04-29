import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorContent extends StatelessWidget {
  List<Floor> floor;
  FloorContent(this.floor);
  CommonWidgets commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (this.floor != null) {
      return Container(
          width: ScreenUtil().setWidth(750),
          child: Column(
            children: <Widget>[_firstColumn(), _secondColumn()],
          ));
    } else {
      return commonWidgets.requestingData();
    }
  }

  // 第一行左侧
  Widget _firstColumnLeft() {
    return Container(
      width: ScreenUtil().setWidth(375.0),
      child: InkWell(
        onTap: () => {},
        child: Image.network("${this.floor[0].image}"),
      ),
    );
  }

  // 第一行右侧
  Widget _firstColumnRight() {
    return Container(
      width: ScreenUtil().setWidth(375.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () => {},
            child: Image.network("${this.floor[1].image}"),
          ),
          InkWell(
            onTap: () => {},
            child: Image.network("${this.floor[2].image}"),
          ),
        ],
      ),
    );
  }

  // 第一行
  Widget _firstColumn() {
    return Row(
      children: <Widget>[_firstColumnLeft(), _firstColumnRight()],
    );
  }

  Widget _secondColumn() {
    return Row(
      children: <Widget>[
        _secondColumnItem(this.floor[3]),
        _secondColumnItem(this.floor[4])
      ],
    );
  }

  Widget _secondColumnItem(Floor floor) {
    return Container(
      width: ScreenUtil().setWidth(375.0),
      child: InkWell(
        onTap: () => {},
        child: Image.network("${floor.image}"),
      ),
    );
  }
}
