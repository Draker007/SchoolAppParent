

class LoginResponse {

  String Parents_Name;
  String login_response;
  String Parents_ID;
  String Role_ID;
  String Status_Response;

  LoginResponse({this.Parents_Name,
    this.login_response,
    this.Parents_ID,
    this.Role_ID,
    this.Status_Response});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    Parents_Name = json['Parents_Name'];
    login_response = json['login_response'];
    Parents_ID = json['Parents_ID'];
    Role_ID = json['Role_ID'];
    Status_Response = json['Status_Response'];
  }
}
