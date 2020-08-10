class Events_Response{
  List<Student_event_response> student_event_response;
  String Status_Response;

  Events_Response({this.student_event_response, this.Status_Response});

  Events_Response.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['student_event_response'] != null) {
      student_event_response = new List<Student_event_response>();
      json['student_event_response'].forEach((v) {
        student_event_response.add(new Student_event_response.fromJson(v));
      });
    }
  }
}

class Student_event_response {
    String Event_Info;

    String Event_Date;

    String Event_Name;

    String Events_ID,Event_Image;

    Student_event_response({this.Event_Info, this.Event_Date, this.Event_Name,
      this.Events_ID, this.Event_Image});

    Student_event_response.fromJson(Map<String, dynamic> json) {
      Event_Info = json['Event_Info'];
      Event_Date = json['Event_Date'];
      Event_Name = json['Event_Name'];
      Events_ID = json['Events_ID'];
      Event_Image = json['Event_Image'];
    }
}