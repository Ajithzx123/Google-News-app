import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_news_and_books/views/BooksApp.dart';
import 'package:google_news_and_books/views/NewsApp.dart';

import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final maincolor = const Color(0xff181c27);
  int selected = 0;

  void indexvalue(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [ News(), const Books()];
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: pages[selected],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                   EdgeInsets.symmetric(horizontal: 20.w, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 10,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: Icons.newspaper,
                    text: 'News',
                  ),
                  GButton(
                    icon: Icons.book_sharp,
                    text: 'Books',
                  ),
                 
                ],
                selectedIndex: selected,
                onTabChange: (index) {
                  setState(() {
                    selected = index;
                  });
                },
              ),
            ),
          ),
        ));
  }
}
