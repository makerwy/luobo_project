class HomeHeaderInfo {
  HomeHeaderInfo({
    this.banner,
    this.brandList,
  });

  List<HomeBanner>? banner;
  List<HomeBanner>? brandList;

  factory HomeHeaderInfo.fromJson(Map<String, dynamic> json) => HomeHeaderInfo(
        banner: List<HomeBanner>.from(
            json["banner"].map((x) => HomeBanner.fromJson(x))),
        brandList: List<HomeBanner>.from(
            json["brandList"].map((x) => HomeBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from((banner ?? []).map((x) => x.toJson())),
        "brandList":
            List<dynamic>.from((brandList ?? []).map((x) => x.toJson())),
      };
}

class HomeBanner {
  HomeBanner({
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

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
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
