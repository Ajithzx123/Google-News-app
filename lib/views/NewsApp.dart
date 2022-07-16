import 'package:flutter/material.dart';
import 'package:google_news_and_books/views/tabs/Bussines.dart';
import 'package:google_news_and_books/views/tabs/Enterainment.dart';
import 'package:google_news_and_books/views/tabs/Health.dart';
import 'package:google_news_and_books/views/tabs/Sports.dart';
import 'package:google_news_and_books/views/tabs/Technology.dart';
import 'package:google_news_and_books/views/tabs/TopHeadline.dart';
import 'package:google_news_and_books/views/widget/newsCard.dart';
import 'package:google_news_and_books/views/widget/tabs.dart';
import 'package:sizer/sizer.dart';

class News extends StatefulWidget {
  News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              centerTitle: true,
              title: Text("Google News"),
              bottom: const TabBar(tabs: [
                Tab(
                  text: "Science",
                  icon: Icon(Icons.science),
                ),
                Tab(
                  text: "Business",
                  icon: Icon(Icons.business),
                ),
                Tab(
                  text: "Sports",
                  icon: Icon(Icons.sports),
                ),
                Tab(
                  text: "Technology",
                  icon: Icon(Icons.leaderboard),
                ),
                Tab(
                  text: "Health",
                  icon: Icon(Icons.health_and_safety),
                ),
                Tab(text: "Entertainment", icon: Icon(Icons.party_mode)),
              ]),
            ),
            preferredSize: Size.fromHeight(17.h)),
        body: TabBarView(children: [
          TopHeadlines(),
          Bussines(),
          Sports(),
          Technology(),
          Health(),
          Enterainment(),
        ]),
      ),
    );
  }
}
