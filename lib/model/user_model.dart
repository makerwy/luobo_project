class UserModel {
  UserModel({
    this.accessToken,
    this.auditState,
    this.businessLicense,
    this.businessLicensePicture,
    this.companyName,
    this.contactMobile,
    this.contactName,
    this.corporationIdCard,
    this.corporationName,
    this.createTime,
    this.id,
    this.idCard,
    this.idCardPicture,
    this.introduce,
    this.mobile,
    this.signboard,
    this.storeName,
    this.updateTime,
    this.userAuditState,
    this.userId,
  });

  String? accessToken;
  String? auditState;
  String? businessLicense;
  String? businessLicensePicture;
  String? companyName;
  String? contactMobile;
  String? contactName;
  String? corporationIdCard;
  String? corporationName;
  int? createTime;
  int? id;
  String? idCard;
  String? idCardPicture;
  String? introduce;
  String? mobile;
  String? signboard;
  String? storeName;
  int? updateTime;
  String? userAuditState;
  int? userId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["accessToken"],
        auditState: json["auditState"],
        businessLicense: json["businessLicense"],
        businessLicensePicture: json["businessLicensePicture"],
        companyName: json["companyName"],
        contactMobile: json["contactMobile"],
        contactName: json["contactName"],
        corporationIdCard: json["corporationIdCard"],
        corporationName: json["corporationName"],
        createTime: json["createTime"],
        id: json["id"],
        idCard: json["idCard"],
        idCardPicture: json["idCardPicture"],
        introduce: json["introduce"],
        mobile: json["mobile"],
        signboard: json["signboard"],
        storeName: json["storeName"],
        updateTime: json["updateTime"],
        userAuditState: json["userAuditState"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "auditState": auditState,
        "businessLicense": businessLicense,
        "businessLicensePicture": businessLicensePicture,
        "companyName": companyName,
        "contactMobile": contactMobile,
        "contactName": contactName,
        "corporationIdCard": corporationIdCard,
        "corporationName": corporationName,
        "createTime": createTime,
        "id": id,
        "idCard": idCard,
        "idCardPicture": idCardPicture,
        "introduce": introduce,
        "mobile": mobile,
        "signboard": signboard,
        "storeName": storeName,
        "updateTime": updateTime,
        "userAuditState": userAuditState,
        "userId": userId,
      };
}
