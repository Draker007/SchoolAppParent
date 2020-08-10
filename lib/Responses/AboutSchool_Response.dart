class AboutSchool_Response{
  List<Admin_schoolimpnoticelist_response> about_school_response;
  List<Admin_schoolfacilitylist_responses> Admin_schoolfacilitylist_response;
  String Status_Response;

  AboutSchool_Response({this.about_school_response,
      this.Admin_schoolfacilitylist_response, this.Status_Response});

  AboutSchool_Response.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['about_school_response'] != null) {
      about_school_response = new List<Admin_schoolimpnoticelist_response>();
      json['about_school_response'].forEach((v) {
        about_school_response.add(new Admin_schoolimpnoticelist_response.fromJson(v));
      });
    }
    if (json['Admin_schoolfacilitylist_response'] != null) {
      Admin_schoolfacilitylist_response = new List<Admin_schoolfacilitylist_responses>();
      json['Admin_schoolfacilitylist_response'].forEach((v) {
        Admin_schoolfacilitylist_response.add(new Admin_schoolfacilitylist_responses.fromJson(v));
      });
    }
  }
}




class Admin_schoolfacilitylist_responses {
  String About_School_Facility_ID,About_School_Facility_Info,About_School_Facility_Images;

  Admin_schoolfacilitylist_responses({this.About_School_Facility_ID,
      this.About_School_Facility_Info, this.About_School_Facility_Images});

  Admin_schoolfacilitylist_responses.fromJson(Map<String, dynamic> json) {
    About_School_Facility_ID = json['About_School_Facility_ID'];
    About_School_Facility_Info = json['About_School_Facility_Info'];
    About_School_Facility_Images = json['About_School_Facility_Images'];

  }
}







class Admin_schoolimpnoticelist_response {
  String About_School_Info,About_School_ID,About_School_Contact_Number,About_School_Contact_Email,About_School_Contact_Address,About_School_Images,
      info_status,Created_on;

  Admin_schoolimpnoticelist_response({
      this.About_School_Info,
      this.About_School_ID,
      this.About_School_Contact_Number,
      this.About_School_Contact_Email,
      this.About_School_Contact_Address,
      this.About_School_Images,
      this.info_status,
      this.Created_on});
  Admin_schoolimpnoticelist_response.fromJson(Map<String, dynamic> json) {
    About_School_Info = json['About_School_Info'];
    About_School_ID = json['About_School_ID'];
    About_School_Contact_Number = json['About_School_Contact_Number'];
    About_School_Contact_Email = json['About_School_Contact_Email'];
    About_School_Contact_Address = json['About_School_Contact_Address'];
    About_School_Images = json['About_School_Images'];
    info_status = json['info_status'];
    Created_on = json['Created_on'];
  }
}


