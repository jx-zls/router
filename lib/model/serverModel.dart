

class ServerProvider {
  int id;
  int orderAll=0;
  int orderDelay=0;
  int orderGood=0;
  int orderNegative=0;
  int orderNomal=0;
  int orderOntime=0;
  int orderQualified=0;
  int userId=0;

  ServerProvider();
  ServerProvider.passValue(json){
    this.orderAll = json["orderAll"];
    this.orderDelay = json["orderDelay"];
    this.orderGood = json["orderGood"];
    this.orderNegative = json["orderNegative"];
    this.orderNomal = json["orderNomal"];
    this.orderOntime = json["orderOntime"];
    this.orderQualified = json["orderQualified"];
    this.userId = json["userId"];
  }
}
class ServerAddress {
  String city;
  String detail;
  int id;
  int isDefault;
  String oneAddress;
  String phone;
  String province;
  String region;
  int type;
  int userId;
  String userName;

  ServerAddress();
  ServerAddress.passValue(json){
    this.city = json["city"];
    this.detail = json["detail"];
    this.isDefault = json["isDefault"];
    this.oneAddress = json["oneAddress"];
    this.phone = json["phone"];
    this.province = json["province"];
    this.region = json["region"];
    this.type = json["type"];
    this.userId = json["userId"];
    this.userName = json["userName"];
  }
}

class ServerModel {
  
  String userRole;
  ServerProvider servicerProvider;
  ServerAddress serverAddress;

  ServerModel.passValue(Map<String,dynamic>json){
    userRole = json["userRole"];
    servicerProvider = json["servicerProvider"] != null ? ServerProvider.passValue(json["servicerProvider"]) : ServerProvider();
    serverAddress = json["address"] != null ? ServerAddress.passValue(json["address"]) : ServerAddress();
  }
}