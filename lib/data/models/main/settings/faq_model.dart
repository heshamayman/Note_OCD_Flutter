//This model is use for get frequency of questions and answer  from api
class FAQModel
{
  String? code;
  String? message;
  List<FAQData> List_FAQData =[];

  FAQModel.fromJson({required Map<String, dynamic> json})
  {
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element){
      FAQData item = FAQData.fromJson(json: element);
      List_FAQData.add(item);
    });
  }
  
}

class FAQData
{
  String? question;
  String? answer;

  FAQData.fromJson({required Map<String, dynamic> json})
  {
    question = json['question'];
    answer = json['answer'];

  }
}