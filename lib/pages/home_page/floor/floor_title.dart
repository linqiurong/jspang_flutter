import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class FloorTitle extends StatelessWidget {
  FloorPic floorpic;
  FloorTitle(this.floorpic);

  CommonWidgets commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (this.floorpic != null) {
      return Container(
        child: Image.network(floorpic.pICTUREADDRESS),
      );
    } else {
      return commonWidgets.requestingData();
    }
  }
}
