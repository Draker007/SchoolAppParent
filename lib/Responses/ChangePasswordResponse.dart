class ChangePasswordResponse{
  String UserName,User_Role,User_ID,Status_Response, change_password_response,resrt_password_otp_response,reset_password_response;

  ChangePasswordResponse(
      {this.UserName,
      this.User_Role,
      this.User_ID,
      this.Status_Response,
      this.change_password_response,
      this.resrt_password_otp_response,
      this.reset_password_response});
  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    UserName = json['UserName'];
    User_Role = json['User_Role'];
    User_ID = json['User_ID'];
    Status_Response = json['Status_Response'];
    change_password_response = json['change_password_response'];
    resrt_password_otp_response = json['resrt_password_otp_response'];
    reset_password_response = json['reset_password_response'];
  }
}