class Exams_Response {
  List<Exams_list_response> exams_list_response;

    String Status_Response;

  Exams_Response({this.exams_list_response, this.Status_Response});

  Exams_Response.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['exams_list_response'] != null) {
      exams_list_response = new List<Exams_list_response>();
      json['exams_list_response'].forEach((v) {
        exams_list_response.add(new Exams_list_response.fromJson(v));
      });
    }
  }
}

class Exams_list_response {
    String Exam_Name;

    String Status_ID;

    String Exams_ID;

    Exams_list_response({this.Exam_Name, this.Status_ID, this.Exams_ID});

    Exams_list_response.fromJson(Map<String, dynamic> json) {
      Exam_Name = json['Exam_Name'];
      Status_ID = json['Status_ID'];
      Exams_ID = json['Exams_ID'];
    }
}