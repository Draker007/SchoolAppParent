
class ChooseKidResponse{

String Status_Response;

List<Select_Kids_Response> select_kids_response;


ChooseKidResponse({this.Status_Response, this.select_kids_response});

  ChooseKidResponse.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
  if (json['select_kids_response'] != null) {
    select_kids_response = new List<Select_Kids_Response>();
    json['select_kids_response'].forEach((v) {
      select_kids_response.add(new Select_Kids_Response.fromJson(v));
    });
  }
}

}

class Select_Kids_Response {
  String Student_ID;
  String Student_Name;
  String Student_Gender;
  String Student_Status;
  String Student_Image_Name;
  String Class_Name;
  String Class_number;
  String Section_Name;
  String Class_ID;
  String Section_ID;

  Select_Kids_Response({
      this.Student_ID,
      this.Student_Name,
      this.Student_Gender,
      this.Student_Status,
      this.Student_Image_Name,
      this.Class_Name,
      this.Class_number,
      this.Section_Name,
      this.Class_ID,
      this.Section_ID
  });

  Select_Kids_Response.fromJson(Map<String, dynamic> json) {
    Student_ID = json['Student_ID'];
    Student_Name = json['Student_Name'];
    Student_Gender = json['Student_Gender'];
    Student_Status = json['Student_Status'];
    Student_Image_Name = json['Student_Image_Name'];
    Class_Name = json['Class_Name'];
    Class_number = json['Class_number'];
    Section_Name = json['Section_Name'];
    Class_ID = json['Class_ID'];
    Section_ID = json['Section_ID'];
  }


}