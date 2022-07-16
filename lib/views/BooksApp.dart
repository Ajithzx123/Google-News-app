import 'package:flutter/material.dart';
import 'package:google_news_and_books/controllers/controllerobject.dart';
import 'package:google_news_and_books/views/widget/customBook.dart';
import 'package:sizer/sizer.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  void initState() {
     booksController.getSports(
        url:
            'https://www.googleapis.com/books/v1/volumes?q=Harry+Potter&key=AIzaSyAx6Uv9e5aJ5kSYypF6S5OnF7ONSv4IBfg');
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.black,
            toolbarHeight: 15.h,
            title: Text(
              "Google Books",
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            centerTitle: true,
          ),
          preferredSize: Size.fromHeight(12.h)),
      body: GridView.builder(
        padding: EdgeInsets.all(5.w),
        shrinkWrap: true,
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // mainAxisSpacing: ,
          crossAxisSpacing: 5.w,
          childAspectRatio: 150 / 250,
        ),
        itemBuilder: (context, index) {
          return BookAndName(
            tap: () {
              // Get.to(() => InsideBook(
              //     item: products.dt![index]));
            },
            image: "https://www.adobe.com/express/create/cover/media_178ebed46ae02d6f3284c7886e9b28c5bb9046a02.jpeg?width=400&format=jpeg&optimize=medium",
            name: "Lunar Storm",
            amount: "₹500.00",
          );
        },
      ),
    );
  }
}
