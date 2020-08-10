class Exam_Subject_Response{
  List<Exams_subjects_response> exams_subjects_response;

    String Status_Response;

  Exam_Subject_Response({this.exams_subjects_response, this.Status_Response});

  Exam_Subject_Response.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['exams_subjects_response'] != null) {
      exams_subjects_response = new List<Exams_subjects_response>();
      json['exams_subjects_response'].forEach((v) {
        exams_subjects_response.add(new Exams_subjects_response.fromJson(v));
      });
    }
  }
}

class Exams_subjects_response {
    String Exam_Name,Subject_label_name;

    String Exams_Subject_Mapping_ID;

    String Exams_Date;

    String Exams_Max_Marks;

    String Syllabus;

    String Subject_Type;

    String Subject_Name;

    Exams_subjects_response(
      {this.Exam_Name,
      this.Subject_label_name,
      this.Exams_Subject_Mapping_ID,
      this.Exams_Date,
      this.Exams_Max_Marks,
      this.Syllabus,
      this.Subject_Type,
      this.Subject_Name});
    Exams_subjects_response.fromJson(Map<String, dynamic> json) {
      Exam_Name = json['Exam_Name'];
      Subject_label_name = json['Subject_label_name'];
      Exams_Subject_Mapping_ID = json['Exams_Subject_Mapping_ID'];
      Exams_Date = json['Exams_Date'];
      Exams_Max_Marks = json['Exams_Max_Marks'];
      Syllabus = json['Syllabus'];
      Subject_Type = json['Subject_Type'];
      Subject_Name = json['Subject_Name'];
    }
}