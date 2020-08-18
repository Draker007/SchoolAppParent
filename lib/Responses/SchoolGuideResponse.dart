
class SchoolGuideResponse{
  List<Important_notice_responses> Important_notice_response;

   String Status_Response;

  SchoolGuideResponse({this.Important_notice_response, this.Status_Response});
  SchoolGuideResponse.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['Important_notice_response'] != null) {
      Important_notice_response = new List<Important_notice_responses>();
      json['Important_notice_response'].forEach((v) {
        Important_notice_response.add(new Important_notice_responses.fromJson(v));
      });
    }
  }


}

class Important_notice_responses {
  String Important_notice;

    String Important_notice_ID;

    String Important_notice_Type;

  Important_notice_responses({this.Important_notice, this.Important_notice_ID,
      this.Important_notice_Type});

  Important_notice_responses.fromJson(Map<String, dynamic> json) {
    Important_notice = json['Important_notice'];
    Important_notice_ID = json['Important_notice_ID'];
    Important_notice_Type = json['Important_notice_Type'];

  }

}