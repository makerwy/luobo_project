class HomeHeadInfo {
  HomeHeadInfo({
    this.banner,
    this.brandList,
  });

  List<Banner>? banner;
  List<Banner>? brandList;

  factory HomeHeadInfo.fromJson(Map<String, dynamic> json) => HomeHeadInfo(
        banner:
            List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
        brandList:
            List<Banner>.from(json["brandList"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from((banner ?? []).map((x) => x.toJson())),
        "brandList":
            List<dynamic>.from((brandList ?? []).map((x) => x.toJson())),
      };
}

class Banner {
  Banner({
    this.createTime,
    this.id,
    this.name,
    this.picture,
    this.sort,
    this.state,
    this.updateTime,
    this.url,
    this.categoryId,
    this.logoUrl,
  });

  int? createTime;
  int? id;
  String? name;
  String? picture;
  int? sort;
  String? state;
  int? updateTime;
  String? url;
  int? categoryId;
  String? logoUrl;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        createTime: json["createTime"],
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
        sort: json["sort"],
        state: json["state"],
        updateTime: json["updateTime"],
        url: json["url"],
        categoryId: json["categoryId"],
        logoUrl: json["logoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "createTime": createTime,
        "id": id,
        "name": name,
        "picture": picture,
        "sort": sort,
        "state": state,
        "updateTime": updateTime,
        "url": url,
        "categoryId": categoryId == null,
        "logoUrl": logoUrl,
      };
}
