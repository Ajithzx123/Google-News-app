import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_news_and_books/views/mainScreen.dart';
import 'package:sizer/sizer.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      );
      });
      
  }
}