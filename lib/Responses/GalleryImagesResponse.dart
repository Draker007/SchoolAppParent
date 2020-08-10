 class GalleryImagesResponse{
   List<gallery_images_responses> gallery_images_response;
     String Status_Response;

   GalleryImagesResponse.fromJson(Map<String, dynamic> json) {
     Status_Response = json['Status_Response'];
     if (json['gallery_images_response'] != null) {
       gallery_images_response = new List<gallery_images_responses>();
       json['gallery_images_response'].forEach((v) {
         gallery_images_response.add(new gallery_images_responses.fromJson(v));
       });
     }
   }
 }

class gallery_images_responses {
  String Gallery_images_path, Gallery_Category_ID, Status_ID, Gallery_Category_name;

  gallery_images_responses({this.Gallery_images_path, this.Gallery_Category_ID,
      this.Status_ID, this.Gallery_Category_name});

  gallery_images_responses.fromJson(Map<String, dynamic> json) {
    Gallery_images_path = json['Gallery_images_path'];
    Gallery_Category_ID = json['Gallery_Category_ID'];
    Status_ID = json['Status_ID'];
    Gallery_Category_name = json['Gallery_Category_name'];
  }
}