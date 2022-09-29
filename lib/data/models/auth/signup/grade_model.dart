//This model is use for get grades from api
class GradeModel
{
  String? code;
  String? message;
  List<GradeData> List_GradeData = [];
  GradeModel.fromJson({required Map<String, dynamic> json}) {
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element) {
      if(!element['grade'].toString().startsWith("Grade")) return;
      GradeData item = GradeData.fromJson(json: element);
      List_GradeData.add(item);
    });
  }
}

class GradeData{
  String? grade;
  GradeData.fromJson({required Map<String, dynamic> json}) {
    grade = json['grade'];
  }
}