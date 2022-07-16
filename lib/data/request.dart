import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClass {
  Future<dynamic> getJson({
    required String url,
    required bool requiresAuth,
  }) async {
    try {
      http.Response response;
      if (requiresAuth) {
        response = await http.get(
          Uri.parse(url),
        );
        print(response.statusCode);
      } else {
        response = await http.get(Uri.parse(url));
      }
      var responseJson = _returnResponse(response);
      // Navigator.pop(Get.context!);
      print('Response ' + responseJson.toString());
      return responseJson;
    } catch (e) {
      print(e.toString());
    }
  }

  dynamic _returnResponse(http.Response response) async {
    // try {
    var responseJson;
    var errorObject;
    // print('Status Code ' + response.statusCode.toString());
    // print('Response.body___ ' + response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        {
          responseJson = json.decode(response.body);
          return responseJson;
        }

      case 204:
        {
          // print('204 true');
          return true;
        }

      case 400:
        {
          print('Status Code ' + response.statusCode.toString());
          responseJson = json.decode(response.body);
          errorObject = responseJson['error'];
          errorObject.forEach((key, value) {});
          break;
        }
    }
  }
}
