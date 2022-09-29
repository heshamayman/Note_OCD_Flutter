//This model is use for get universities from api
class UniversityModel {
  String? code;
  String? message;
  List<UniversityData> List_UniversityData = [];
  UniversityModel.fromJson({required Map<String, dynamic> json}) {
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element) {
      UniversityData item = UniversityData.fromJson(json: element);
      List_UniversityData.add(item);
    });
  }
}

class UniversityData{
  int? id;
  String? name;
  UniversityData.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
  }
}