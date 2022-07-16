
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewsCard extends StatelessWidget {
  final String image;
  final String title;

  const NewsCard({
    required this.image,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.w),
      height: 30.h,
      width: 100.w,
      decoration: BoxDecoration(color: Color.fromARGB(255, 232, 232, 232),
      borderRadius: BorderRadius.circular(5.w)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5.w),
            
            height: 20.h,
            width: 90.w,
            
            decoration: BoxDecoration(color: Colors.grey,
            image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(5.w)
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.w),
            child: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}