import 'dart:developer';

import 'package:google_news_and_books/B/BooksModel.dart';


import '../data/request.dart';

class BooksRepository {
  final ApiClass helper = ApiClass();

  Future<dynamic> SportsCollection({
    required String Repositaryurl,
  }) async {
    try {
      var DetailsApiResponse =
          await helper.getJson(requiresAuth: true, url: Repositaryurl);
      if (DetailsApiResponse != null) {
        log('Response------ ${DetailsApiResponse}');
        BooksModel Details = BooksModel.fromJson(DetailsApiResponse);
        log('dummy---------------- ${Details}');
        return Details;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
