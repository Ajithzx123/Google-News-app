import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_news_and_books/controllers/controllerobject.dart';
import 'package:google_news_and_books/views/widget/newsCard.dart';

class Technology extends StatefulWidget {
  const Technology({Key? key}) : super(key: key);

  @override
  State<Technology> createState() => _TechnologyState();
}

class _TechnologyState extends State<Technology> {
  @override
  void initState() {
    userController.getSports(
        url:
            'https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=b7780e0c51c24d48b1407a2daeadec19');
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => userController.NewsDetails.isNotEmpty
          ? ListView.builder(
              itemCount: userController.NewsDetails.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsCard(
                    image:
                        userController.NewsDetails[index].urlToImage.toString(),
                    title: userController.NewsDetails[index].title.toString());
              })
          : CircularProgressIndicator()),
    );
  }
}
