class HomeHotDataModel {
  String code;
  String message;

  List<GoodsHotModel> data;

  HomeHotDataModel({this.code, this.message, this.data});

  HomeHotDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<GoodsHotModel>();
      json['data'].forEach((v) {
        data.add(new GoodsHotModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoodsHotModel {
  String name;
  String image;
  double mallPrice;
  String goodsId;
  double price;

  GoodsHotModel(
      {this.name, this.image, this.mallPrice, this.goodsId, this.price});

  GoodsHotModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    mallPrice = json['mallPrice'];
    goodsId = json['goodsId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    return data;
  }
}
