import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/model/home_base_model.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';

class AdBanner extends StatelessWidget {
  AdvertesPicture advertesPicture;
  AdBanner(this.advertesPicture);

  CommonWidgets commonWidgets = new CommonWidgets();
  @override
  Widget build(BuildContext context) {
    if (this.advertesPicture != null) {
      return Container(
        margin: EdgeInsets.only(top: 5.0),
        color: Colors.white,
        child: Image.network("${this.advertesPicture.pICTUREADDRESS}"),
      );
    } else {
      return commonWidgets.requestingData();
    }
  }
}
