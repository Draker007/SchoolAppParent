class SyllabusResponse{
  List<Syllabus_files_response> syllabus_files_response;

    String Status_Response;

  SyllabusResponse({this.syllabus_files_response, this.Status_Response});

  SyllabusResponse.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['syllabus_files_response'] != null) {
      syllabus_files_response = new List<Syllabus_files_response>();
      json['syllabus_files_response'].forEach((v) {
        syllabus_files_response.add(new Syllabus_files_response.fromJson(v));
      });
    }
  }
}

class Syllabus_files_response {

    String Syllabus_dload_file,Subject_label_name,Sub_Subject_Name;

    String Syllabus_download_ID;

    String Subject_Type;

    String Subject_Name;

    String Subject_ID,Status_ID;

    Syllabus_files_response(
      {this.Syllabus_dload_file,
      this.Subject_label_name,
      this.Sub_Subject_Name,
      this.Syllabus_download_ID,
      this.Subject_Type,
      this.Subject_Name,
      this.Subject_ID,
      this.Status_ID});
    Syllabus_files_response.fromJson(Map<String, dynamic> json) {
      Syllabus_dload_file = json['Syllabus_dload_file'];
      Subject_label_name = json['Subject_label_name'];
      Sub_Subject_Name = json['Sub_Subject_Name'];
      Syllabus_download_ID = json['Syllabus_download_ID'];
      Subject_Type = json['Subject_Type'];
      Subject_Name = json['Subject_Name'];
      Subject_ID = json['Subject_ID'];
      Status_ID = json['Status_ID'];

    }
}