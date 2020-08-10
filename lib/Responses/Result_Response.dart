
class Result_Response{
  List<Results_response> results_response;

    String Status_Response;

  Result_Response({this.results_response, this.Status_Response});
  Result_Response.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['results_response'] != null) {
      results_response = new List<Results_response>();
      json['results_response'].forEach((v) {
        results_response.add(new Results_response.fromJson(v));
      });
    }
  }
}

class Results_response {
    String Student_Name,Sub_Subject_Name,Sub_Subject_ID,Subject_label_name;

    String Student_ID;

    String Exams_Date;

    String Exams_Max_Marks;

    String Subject_Name;

    String Subject_ID;

     String Exams_ID;

    String Obtained_Marks;

    Results_response(
     { this.Student_Name,
      this.Sub_Subject_Name,
      this.Sub_Subject_ID,
      this.Subject_label_name,
      this.Student_ID,
      this.Exams_Date,
      this.Exams_Max_Marks,
      this.Subject_Name,
      this.Subject_ID,
        this.Exams_ID,
      this.Obtained_Marks});

    Results_response.fromJson(Map<String, dynamic> json) {
      Student_Name = json['Student_Name'];
      Sub_Subject_Name = json['Sub_Subject_Name'];
      Sub_Subject_ID = json['Sub_Subject_ID'];
      Subject_label_name = json['Subject_label_name'];
      Student_ID = json['Student_ID'];
      Exams_Date = json['Exams_Date'];
      Exams_Max_Marks = json['Exams_Max_Marks'];
      Subject_Name = json['Subject_Name'];
      Subject_ID = json['Subject_ID'];
      Exams_ID = json['Exams_ID'];
      Obtained_Marks = json['Obtained_Marks'];


    }
}