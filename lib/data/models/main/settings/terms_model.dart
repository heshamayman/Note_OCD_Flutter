//This model is use for get terms & conditions from api
class TermsModel {
  String? code;
  var terms;

  TermsModel.fromJson({required Map<String, dynamic> json}) {
    print("TERMS :: " + json['data']['Terms']);
    print(json);
    code = json['code'];
    terms = json['data']['Terms'];
  }
}
