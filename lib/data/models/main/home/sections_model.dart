//This model is use for get sections from api
class SectionsModel {
  String? code;
  String? message;
  List<SectionData> sections = [];

  SectionsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];

    if (json['data'].isEmpty) return;

    for (json in json['data']) {
      sections.add(SectionData.fromJson(json));
    }
  }
}

class SectionData {
  int? id;
  String? sectionDate;
  String? sectionStartTime;
  String? sectionEndTime;
  String? sectionSubject;

  SectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionDate = json['sectionDate'];
    sectionStartTime = json['sectionStartTime'];
    sectionEndTime = json['sectionEndTime'];
    sectionSubject = json['sectionSubject'];
  }
}
