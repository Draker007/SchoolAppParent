class AchivementResponse{
  List <Student_performance_response> student_performance_response;
  String Status_Response;

  AchivementResponse({this.student_performance_response, this.Status_Response});

  AchivementResponse.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['student_performance_response'] != null) {
      student_performance_response = new List<Student_performance_response>();
      json['student_performance_response'].forEach((v) {
        student_performance_response.add(new Student_performance_response.fromJson(v));
      });
    }
  }

}

class Student_performance_response {
    String Performance_Comments;

    String Performance_Date;

    String Performance_ID;

    String Performance_title;
     String Acheivement_status;
    String Status_ID;

    Student_performance_response(
     { this.Performance_Comments,
      this.Performance_Date,
      this.Performance_ID,
      this.Performance_title,
      this.Acheivement_status,
        this.Status_ID});

    Student_performance_response.fromJson(Map<String, dynamic> json) {
      Performance_Comments = json['Performance_Comments'];
      Status_ID = json['Status_ID'];
      Performance_Date = json['Performance_Date'];
      Performance_ID = json['Performance_ID'];
      Performance_title = json['Performance_title'];
      Acheivement_status = json['Acheivement_status'];

    }
}