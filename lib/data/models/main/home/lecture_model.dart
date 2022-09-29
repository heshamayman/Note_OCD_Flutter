//This model is use for get lectures from api
class LecturesModel {
  String? code;
  String? message;
  List<LectureData> lectures = [];

  LecturesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];

    if (json['data'].isEmpty) return;

    for (json in json['data']) {
      lectures.add(LectureData.fromJson(json));
    }
  }
}

class LectureData {
  int? id;
  String? lectureDate;
  String? lectureStartTime;
  String? lectureEndTime;
  String? lectureSubject;

  LectureData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lectureDate = json['lectureDate'];
    lectureStartTime = json['lectureStartTime'];
    lectureEndTime = json['lectureEndTime'];
    lectureSubject = json['lectureSubject'];
  }
}
