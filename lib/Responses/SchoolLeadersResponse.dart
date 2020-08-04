
class SchoolLeadersResponse{
  List <Student_leaderinfo_responses> Student_leaderinfo_response;
  String Status_Response;

  SchoolLeadersResponse({this.Student_leaderinfo_response, this.Status_Response});

  SchoolLeadersResponse.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['Student_leaderinfo_response'] != null) {
      Student_leaderinfo_response = new List<Student_leaderinfo_responses>();
      json['Student_leaderinfo_response'].forEach((v) {
        Student_leaderinfo_response.add(new Student_leaderinfo_responses.fromJson(v));
      });
    }
  }
}

class Student_leaderinfo_responses {

  String Student_Name;

String Student_Leaderboard_ID;

String Section_Name;

String Status_ID;

String Student_ID;

String Special_title;

String Class_number;

String Class_Section_Mapping_ID;

String Student_Image_Name;

  Student_leaderinfo_responses({
      this.Student_Name,
      this.Student_Leaderboard_ID,
      this.Section_Name,
      this.Status_ID,
      this.Student_ID,
      this.Special_title,
      this.Class_number,
      this.Class_Section_Mapping_ID,
      this.Student_Image_Name});

  Student_leaderinfo_responses.fromJson(Map<String, dynamic> json) {
    Student_Name = json['Student_Name'];
    Status_ID = json['Status_ID'];
    Student_Leaderboard_ID = json['Student_Leaderboard_ID'];
    Section_Name = json['Section_Name'];
    Student_ID = json['Student_ID'];
    Special_title = json['Special_title'];
    Class_number = json['Class_number'];
    Class_Section_Mapping_ID = json['Class_Section_Mapping_ID'];
    Student_Image_Name = json['Student_Image_Name'];

  }
}

//String Student_Name;

//String Student_Leaderboard_ID;
//
//String Section_Name;
//
//String Status_ID;
//
//String Student_ID;
//
//String Special_title;
//
//String Class_number;
//
//String Class_Section_Mapping_ID;
//
//String Student_Image_Name;
