import 'http_request.dart';
class HomeRequest {

  
  Future <dynamic>loginByName(name,password, successF, failureF) async {
    final url = ":9092/api/user/loginByName";
    final result = await HttpRequest.request(url, params: {'name':name, 'passWord':password});
      if(result["code"] == 200){
        successF(result["data"]);
      }else{
        print('result 2 === ');
        failureF();
      }
  }
}