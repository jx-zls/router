
class MineModel {
  int addressId;
  String defaultCase;
  String field;
  int id;
  String nickName;
  int number;
  String phone;
  String qualifications;
  String role;
  String score;
  String sex = '未设置';
  int userId;

  MineModel.passValue(Map<String, dynamic> json){
    this.addressId = json["addressId"];
    this.defaultCase = json["defaultCase"];
    this.field = json["field"];
    this.id = json["id"];
    this.nickName = json["nickName"];
    this.number = json["number"];
    this.phone = json["phone"];
    this.qualifications = json["qualifications"];
    this.role = json["role"];
    this.score = json["score"];
    this.userId = json["userId"];
  }
}