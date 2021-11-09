// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class RecommendGoods {
  RecommendGoods({
    this.brandId,
    this.categoryId,
    this.categoryName,
    this.createTime,
    this.id,
    this.integral,
    this.merchantId,
    this.merchantName,
    this.name,
    this.picture,
    this.price,
    this.saleVolume,
    this.skuId,
    this.skuName,
    this.service,
    this.state,
    this.subtitle,
    this.tagPrice,
    this.thumb,
    this.transportFeeType,
    this.type,
    this.updateTime,
    this.volume,
    this.weight,
  });

  int? brandId;
  int? categoryId;
  String? categoryName;
  int? createTime;
  int? id;
  int? integral;
  int? merchantId;
  String? merchantName;
  String? name;
  String? picture;
  double? price;
  int? saleVolume;
  String? skuId;
  String? skuName;
  String? service;
  String? state;
  String? subtitle;
  double? tagPrice;
  String? thumb;
  String? transportFeeType;
  String? type;
  int? updateTime;
  double? volume;
  double? weight;

  factory RecommendGoods.fromJson(Map<String, dynamic> json) => RecommendGoods(
        brandId: json["brandId"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        createTime: json["createTime"],
        id: json["id"],
        integral: json["integral"],
        merchantId: json["merchantId"],
        merchantName: json["merchantName"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"],
        saleVolume: json["saleVolume"],
        skuId: json["skuId"],
        skuName: json["skuName"],
        service: json["service"],
        state: json["state"],
        subtitle: json["subtitle"],
        tagPrice: json["tagPrice"].toDouble(),
        thumb: json["thumb"],
        transportFeeType: json["transportFeeType"],
        type: json["type"],
        updateTime: json["updateTime"],
        volume: json["volume"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "brandId": brandId,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "createTime": createTime,
        "id": id,
        "integral": integral,
        "merchantId": merchantId,
        "merchantName": merchantName,
        "name": name,
        "picture": picture,
        "price": price,
        "saleVolume": saleVolume,
        "skuId": skuId,
        "skuName": skuName,
        "service": service,
        "state": state,
        "subtitle": subtitle,
        "tagPrice": tagPrice,
        "thumb": thumb,
        "transportFeeType": transportFeeType,
        "type": type,
        "updateTime": updateTime,
        "volume": volume,
        "weight": weight,
      };
}
