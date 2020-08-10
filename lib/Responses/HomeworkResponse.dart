
class HomeworkResponse{
  List <Student_homework_response> subjects_homework_response;
  String Status_Response;

  HomeworkResponse({this.subjects_homework_response, this.Status_Response});

  HomeworkResponse.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['subjects_homework_response'] != null) {
      subjects_homework_response = new List<Student_homework_response>();
      json['subjects_homework_response'].forEach((v) {
        subjects_homework_response.add(new Student_homework_response.fromJson(v));
      });
    }
  }
}

class Student_homework_response {
    String Submission_date,Teachers_Name,Teachers_ID;

    String Status_ID,Sub_Subject_Name;

    String Subject_Homework_Mapping_ID;

    String Subject_Type;

    String Created_by;

    String Subject_Name;

    String Subject_ID;

    String Class_Section_Mapping_ID;

    String Homework;

    String Homework_date;

    Student_homework_response(
      {this.Submission_date,
      this.Teachers_Name,
      this.Teachers_ID,
      this.Status_ID,
      this.Sub_Subject_Name,
      this.Subject_Homework_Mapping_ID,
      this.Subject_Type,
      this.Created_by,
      this.Subject_Name,
      this.Subject_ID,
      this.Class_Section_Mapping_ID,
        this.Homework,
      this.Homework_date});

    Student_homework_response.fromJson(Map<String, dynamic> json) {
      Submission_date = json['Submission_date'];
      Status_ID = json['Status_ID'];
      Teachers_Name = json['Teachers_Name'];
      Teachers_ID = json['Teachers_ID'];
      Sub_Subject_Name = json['Sub_Subject_Name'];
      Subject_Name = json['Subject_Name'];
      Subject_Homework_Mapping_ID = json['Subject_Homework_Mapping_ID'];
      Subject_Type = json['Subject_Type'];
      Created_by = json['Created_by'];
      Subject_ID = json['Subject_ID'];
      Class_Section_Mapping_ID = json['Class_Section_Mapping_ID'];
      Homework = json['Homework'];
      Homework_date = json['Homework_date'];
    }
}