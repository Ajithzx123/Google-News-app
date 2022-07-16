import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_news_and_books/controllers/controllerobject.dart';
import 'package:google_news_and_books/views/widget/newsCard.dart';

class Enterainment extends StatefulWidget {
  const Enterainment({Key? key}) : super(key: key);

  @override
  State<Enterainment> createState() => _EnterainmentState();
}

class _EnterainmentState extends State<Enterainment> {
  @override
  void initState() {
    userController.getSports(
        url:
            'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=b7780e0c51c24d48b1407a2daeadec19');
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
