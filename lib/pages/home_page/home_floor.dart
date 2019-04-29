import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/pages/home_page/floor/floor_title.dart';
import 'package:jspang_flutter_shop/pages/home_page/floor/floor_content.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';

class HomeFloor extends StatelessWidget {
  // 一层
  FloorPic floorpic;
  List<Floor> floor;
  // 层级
  HomeFloor(this.floorpic, this.floor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Column(
        children: <Widget>[
          FloorTitle(floorpic),
          FloorContent(floor),
        ],
      ),
    );
  }
}
