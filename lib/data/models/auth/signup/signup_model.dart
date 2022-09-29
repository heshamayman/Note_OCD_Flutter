//This model is use for signup
class SignupModel
{
  String? code;
  String? message;
  List<UserData> List_UserData=[];
  int? roleId=2;

  SignupModel.fromJson(Map<String,dynamic>json)
  {
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element) {
      UserData item = UserData.fromJson(json: element);
      List_UserData.add(item);
    });
  }
}


class UserData {
  String? name;
  String? email;
  String? password;
  String? gender;
  int? phoneNumber;

  UserData.fromJson({required Map<String, dynamic> json}) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
  }
}