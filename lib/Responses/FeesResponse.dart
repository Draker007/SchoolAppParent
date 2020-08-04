
class FeesResponse{
  List<Fees_Sub_response> fees_class_response;
  String Status_Response;

  FeesResponse({this.fees_class_response, this.Status_Response});

  FeesResponse.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['fees_class_response'] != null) {
      fees_class_response = new List<Fees_Sub_response>();
      json['fees_class_response'].forEach((v) {
        fees_class_response.add(new Fees_Sub_response.fromJson(v));
      });
    }
  }

}

class Fees_Sub_response {
    String Fee_cs_mapping_ID;

    String Fee_name;

    String Fee_amount;

    String Status_ID;


    Fees_Sub_response({
      this.Fee_cs_mapping_ID, this.Fee_name, this.Fee_amount, this.Status_ID});

  Fees_Sub_response.fromJson(Map<String, dynamic> json) {
    Fee_cs_mapping_ID = json['Fee_cs_mapping_ID'];
    Fee_name = json['Fee_name'];
    Fee_amount = json['Fee_amount'];
    Status_ID = json['Status_ID'];

    }

}