import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_news_and_books/B/SportsModel.dart';

import 'package:google_news_and_books/repositary/Newsrepositary.dart';


class HomeController extends GetxController {
  NewsRepositary getNewsRepository = NewsRepositary();

  RxList<Articles> NewsDetails = <Articles>[].obs;

  Future<bool> getSports({
    required String url,
  }) async {
    try {
      SportsApi? DetailsRequestResponse =
          await getNewsRepository.SportsCollection(Repositaryurl: url);
      log("----------controller page------$DetailsRequestResponse");
      if (DetailsRequestResponse != null &&
          DetailsRequestResponse.articles != null) {
        NewsDetails.clear();
        NewsDetails.value = DetailsRequestResponse.articles!;
        NewsDetails.refresh();

        log("podaa........${NewsDetails}");
        return true;
      }

      return false;
    } catch (e) {
      print('IN catch' + e.toString());

      return false;
    }
  }
}
