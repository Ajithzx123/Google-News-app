import 'dart:developer';

import 'package:google_news_and_books/B/SportsModel.dart';


import '../data/request.dart';

class NewsRepositary {
  final ApiClass helper = ApiClass();

  Future<dynamic> SportsCollection({
    required String Repositaryurl,
  }) async {
    try {
      var DetailsApiResponse =
          await helper.getJson(requiresAuth: true, url: Repositaryurl);
      if (DetailsApiResponse != null) {
        log('Response------ ${DetailsApiResponse}');
        SportsApi Details = SportsApi.fromJson(DetailsApiResponse);
        log(' ${Details}');
        return Details;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
