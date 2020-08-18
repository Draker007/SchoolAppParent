
class NotificationResponse{
  List<Notifications_response> notifications_response;

    String Status_Response;

  NotificationResponse({this.notifications_response, this.Status_Response});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['notifications_response'] != null) {
      notifications_response = new List<Notifications_response>();
      json['notifications_response'].forEach((v) {
        notifications_response.add(new Notifications_response.fromJson(v));
      });
    }
  }
}

class Notifications_response {
    String Notification_Text;

    String Status_ID,Created_on ;

    String Notification_ID;

    String Notification_info;

    Notifications_response({this.Notification_Text, this.Status_ID,
      this.Created_on, this.Notification_ID, this.Notification_info});
    Notifications_response.fromJson(Map<String, dynamic> json) {
      Notification_Text = json['Notification_Text'];
      Status_ID = json['Status_ID'];
      Created_on = json['Created_on'];
      Notification_ID = json['Notification_ID'];
      Notification_info = json['Notification_info'];
    }
}