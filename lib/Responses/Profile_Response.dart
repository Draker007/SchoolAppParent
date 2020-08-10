class Profile_Response{
  List<Student_parentinfo_responses> Student_parentinfo_response;

    String Status_Response;

  Profile_Response.fromJson(Map<String, dynamic> json) {
    Status_Response = json['Status_Response'];
    if (json['Student_parentinfo_response'] != null) {
      Student_parentinfo_response = new List<Student_parentinfo_responses>();
      json['Student_parentinfo_response'].forEach((v) {
        Student_parentinfo_response.add(new Student_parentinfo_responses.fromJson(v));
      });
    }
  }
}

class Student_parentinfo_responses {
    String Class_Name,Address;

    String Student_Image_Name;

    String Parents_Name_mother;

    String Section_Name;

    String Parents_Contact_Number;

    String Parents_Image_mother;

    String Parents_Gender;

    String Class_number;

    String Parents_Email;

    String Parents_Name;

    String Parents_Contact_mother;

    String Student_Name;

    String Parents_Image_Name;

    String Student_ID;

    String Student_Gender;

    String Parents_ID,Student_Bloodgroup;

    Student_parentinfo_responses(
      {this.Class_Name,
      this.Address,
      this.Student_Image_Name,
      this.Parents_Name_mother,
      this.Section_Name,
      this.Parents_Contact_Number,
      this.Parents_Image_mother,
      this.Parents_Gender,
      this.Class_number,
      this.Parents_Email,
      this.Parents_Name,
      this.Parents_Contact_mother,
      this.Student_Name,
      this.Parents_Image_Name,
      this.Student_ID,
      this.Student_Gender,
      this.Parents_ID,
      this.Student_Bloodgroup});

    Student_parentinfo_responses.fromJson(Map<String, dynamic> json) {
      Class_Name = json['Class_Name'];
      Address = json['Address'];
      Student_Image_Name = json['Student_Image_Name'];
      Parents_Name_mother = json['Parents_Name_mother'];
      Section_Name = json['Section_Name'];
      Parents_Contact_Number = json['Parents_Contact_Number'];
      Parents_Image_mother = json['Parents_Image_mother'];
      Parents_Gender = json['Parents_Gender'];
      Class_number = json['Class_number'];
      Parents_Email = json['Parents_Email'];
      Parents_Name = json['Parents_Name'];
      Parents_Contact_mother = json['Parents_Contact_mother'];
      Student_Name = json['Student_Name'];
      Parents_Image_Name = json['Parents_Image_Name'];
      Student_ID = json['Student_ID'];
      Student_Gender = json['Student_Gender'];
      Parents_ID = json['Parents_ID'];
      Student_Bloodgroup = json['Student_Bloodgroup'];

    }
}