import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class FloorTitle extends StatelessWidget {
  FloorPic _floorpic;
  FloorTitle(this._floorpic);

  CommonWidgets _commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (this._floorpic != null) {
      return Container(
        child: Image.network(_floorpic.pICTUREADDRESS),
      );
    } else {
      return _commonWidgets.requestingData();
    }
  }
}
