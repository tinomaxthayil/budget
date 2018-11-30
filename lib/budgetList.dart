import 'dart:convert';
import 'dart:io';

class budList {
  final String budName;
  final int amt;
  String imageUrl;

  // All dogs start out at 10, because they're good dogs.

  budList(this.budName, this.amt);
  // dog_model.dart

  Future getImageUrl() async {
    // Null check so our app isn't doing extra work.
    // If there's already an image, we don't need to get one.
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();
    try {
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      imageUrl = json.decode(responseBody)['message'];
    } catch (exception) {
      print(exception);
    }
  }
}
