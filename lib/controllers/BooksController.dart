import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_news_and_books/B/BooksModel.dart';
import 'package:google_news_and_books/repositary/BooksRepositary.dart';


class BooksController extends GetxController {
  BooksRepository getBooksRepositary = BooksRepository();

  RxList<BooksModel> booksDetail = <BooksModel>[].obs;

  Future<bool> getSports({
    required String url,
  }) async {
    try {
      BooksModel? DetailsRequestResponse =
          await getBooksRepositary.SportsCollection(Repositaryurl: url);
      log("----------controller page------$DetailsRequestResponse");
      if (DetailsRequestResponse != null &&
          DetailsRequestResponse.totalItems != null) {
        // booksDetails.clear();
      //  booksDetail.value = DetailsRequestResponse.totalItems!;
        booksDetail.refresh();

        log("podaa........${booksDetail}");
        return true;
      }

      return false;
    } catch (e) {
      print('IN catch' + e.toString());

      return false;
    }
  }
}
