import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_news_and_books/controllers/controllerobject.dart';
import 'package:google_news_and_books/views/widget/newsCard.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  void initState() {
    userController.getSports(
        url:
            'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=b7780e0c51c24d48b1407a2daeadec19');
    // TODO: implement initState
    super.initState();
  }

  @override
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
    ;
  }
}
