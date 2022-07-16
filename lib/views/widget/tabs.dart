import 'package:flutter/material.dart';
import 'package:google_news_and_books/views/widget/newsCard.dart';

import 'package:sizer/sizer.dart';

class TabbarTabs extends StatelessWidget {
  final List<Widget> tab;

  const TabbarTabs({
    required this.tab,
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7.w),
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0.w,
        ),
      ),
      child: TabBar(
          isScrollable: true,
          automaticIndicatorColorAdjustment: true,
          controller: _tabController,
          indicatorPadding: EdgeInsets.zero,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w), color: Colors.black),
          labelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle:
              TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          tabs: tab),
    );
  }
}

class TabBarViews extends StatelessWidget {
  final List<Widget> tabBarView;
  TabBarViews({
    required this.tabBarView,
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(controller: _tabController, children: [NewsCard(image: '', title: '',),
      NewsCard(image: '', title: '',),NewsCard(image: '', title: '',),NewsCard(image: '', title: '',),NewsCard(image: '', title: '',),NewsCard(image: '', title: '',),]),
    );
  }
}
