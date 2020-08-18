class NewsLetter_Response{
  List<Newsletters_files_response> newsletters_files_response;
  String Status_Response;

  NewsLetter_Response({this.newsletters_files_response, this.Status_Response});

  NewsLetter_Response.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['newsletters_files_response'] != null) {
      newsletters_files_response = new List<Newsletters_files_response>();
      json['newsletters_files_response'].forEach((v) {
        newsletters_files_response.add(new Newsletters_files_response.fromJson(v));
      });
    }
  }
}

class Newsletters_files_response {
  String Newsletter_month,Newsletter_year;

    String Status_ID;

    String Newsletter_files_ID;

    String Newsletter_file,Newsletter_thumbnail;

  Newsletters_files_response(
      {this.Newsletter_month,
      this.Newsletter_year,
      this.Status_ID,
      this.Newsletter_files_ID,
      this.Newsletter_file,
      this.Newsletter_thumbnail});

  Newsletters_files_response.fromJson(Map<String, dynamic> json) {
    Newsletter_month = json['Newsletter_month'];
    Status_ID = json['Status_ID'];
    Newsletter_year = json['Newsletter_year'];
    Newsletter_files_ID = json['Newsletter_files_ID'];
    Newsletter_file = json['Newsletter_file'];
    Newsletter_thumbnail = json['Newsletter_thumbnail'];
  }

}