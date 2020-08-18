
class SpecialCharacters {
    static String getCurrectString(String clinic_name) {
    String correctString  = null;

    correctString =
        clinic_name.replaceAll("&amp;","&").replaceAll("amp;","&")
            .replaceAll("&lt;","<").replaceAll("&gt;",">")
            .replaceAll("&quot;", "\"").replaceAll("&#039;", "'");


    return correctString ;
  }
}