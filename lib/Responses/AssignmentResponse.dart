
class AssignmentResponse{
  List <Student_assignment_response> student_assignment_response;
    String Status_Response;

  AssignmentResponse({this.student_assignment_response, this.Status_Response});

  AssignmentResponse.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['student_assignment_response'] != null) {
      student_assignment_response = new List<Student_assignment_response>();
      json['student_assignment_response'].forEach((v) {
        student_assignment_response.add(new Student_assignment_response.fromJson(v));
      });
    }
  }

}

class Student_assignment_response {
    String Submission_date;

    String Status_ID;

    String Assignment_Date;

    String Assignments;

    String Assignments_ID;
    String Subject_Name;

    Student_assignment_response({
      this.Submission_date,
      this.Status_ID,
      this.Assignment_Date,
      this.Assignments,
      this.Assignments_ID,
        this.Subject_Name
    });

    Student_assignment_response.fromJson(Map<String, dynamic> json) {
      Submission_date = json['Submission_date'];
      Status_ID = json['Status_ID'];
      Assignment_Date = json['Assignment_Date'];
      Assignments = json['Assignments'];
      Assignments_ID = json['Assignments_ID'];
      Subject_Name = json['Subject_Name'];

    }

}