
class Attendant_Response{

  List<Attendance_response> attendance_response;

    String Status_Response;

  Attendant_Response(this.attendance_response, this.Status_Response);
  Attendant_Response.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['attendance_response'] != null) {
      attendance_response = new List<Attendance_response>();
      json['attendance_response'].forEach((v) {
        attendance_response.add(new Attendance_response.fromJson(v));
      });
    }
  }

}

class Attendance_response {
    String No_of_days_working;

    String Present;

    String Absent;

    String No_of_days_closed;

    Attendance_response({this.No_of_days_working, this.Present, this.Absent,
      this.No_of_days_closed});

    Attendance_response.fromJson(Map<String, dynamic> json) {
      No_of_days_working = json['No_of_days_working'];
      Present = json['Present'];
      Absent = json['Absent'];
      No_of_days_closed = json['No_of_days_closed'];
      }
}