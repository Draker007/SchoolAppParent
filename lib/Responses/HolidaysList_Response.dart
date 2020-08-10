class HolidaysList_Response{
  List<Holidays_response> holidays_response;
  String Status_Response;

  HolidaysList_Response({this.holidays_response, this.Status_Response});

  HolidaysList_Response.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['holidays_response'] != null) {
      holidays_response = new List<Holidays_response>();
      json['holidays_response'].forEach((v) {
        holidays_response.add(new Holidays_response.fromJson(v));
      });
    }
  }
}

class Holidays_response {
    String Holiday_Date;

    String Holiday_Info;

    String Holidays_ID;

    String Holiday_Name;

    Holidays_response({this.Holiday_Date, this.Holiday_Info, this.Holidays_ID,
      this.Holiday_Name});
    Holidays_response.fromJson(Map<String, dynamic> json) {
      Holiday_Date = json['Holiday_Date'];
      Holiday_Info = json['Holiday_Info'];
      Holidays_ID = json['Holidays_ID'];
      Holiday_Name = json['Holiday_Name'];
    }
}