import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class AdBanner extends StatelessWidget {
  AdvertesPicture _advertesPicture;
  AdBanner(this._advertesPicture);

  CommonWidgets _commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (this._advertesPicture != null) {
      return Container(
        margin: EdgeInsets.only(top: 5.0),
        color: Colors.white,
        child: Image.network("${this._advertesPicture.pICTUREADDRESS}"),
      );
    } else {
      return _commonWidgets.requestingData();
    }
  }
}
