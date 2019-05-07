class CartGoodsModel {
  String goodsName;
  String goodsImage;
  String goodsID;
  bool isChecked;
  int goodsNumber;
  double presentPrice;
  double orignPrice;

  CartGoodsModel(
      {this.goodsName,
      this.goodsID,
      this.goodsImage,
      this.isChecked,
      this.goodsNumber,
      this.presentPrice,
      this.orignPrice});

  CartGoodsModel.fromJson(Map<String, dynamic> json) {
    goodsName = json['goodsName'];
    goodsImage = json['goodsImage'];
    isChecked = json['isChecked'];
    goodsNumber = json['goodsNumber'];
    presentPrice = json['presentPrice'];
    orignPrice = json['orignPrice'];
    goodsID = json['goodsID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsName'] = this.goodsName;
    data['goodsImage'] = this.goodsImage;

    data['isChecked'] = this.isChecked;
    data['goodsNumber'] = this.goodsNumber;
    data['presentPrice'] = this.presentPrice;
    data['orignPrice'] = this.orignPrice;
    data['goodsID'] = this.goodsID;
    return data;
  }
}
