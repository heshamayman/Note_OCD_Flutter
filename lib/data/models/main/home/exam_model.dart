//This model is use for get exams from api
class ExamModel {
  String? code;
  String? message;
  List<ExamData> exams = [];

  ExamModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];

    if (json['data'].isEmpty) return;

    for (json in json['data']) {
      exams.add(ExamData.fromJson(json));
    }
  }
}

class ExamData {
  int? id;
  String? examDate;
  String? examStartTime;
  String? examEndTime;
  String? examSubject;
  bool? isFinal;

  ExamData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examDate = json['examDate'];
    examStartTime = json['examStartTime'];
    examEndTime = json['examEndTime'];
    examSubject = json['examSubject'];
    isFinal = json['final'] ?? false;
  }
}
