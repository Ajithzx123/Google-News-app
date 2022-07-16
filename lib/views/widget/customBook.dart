
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class BookAndName extends StatelessWidget {
  final String image;
  final String name;
  final String amount;
  final VoidCallback tap;

  const BookAndName({
    Key? key,
    required this.image,
    required this.name,
    required this.amount,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      // onTap: () {
      //   // Navigator.push(context, PageTransition(child: InsideBook(), type: PageTransitionType.fade));
      // },
      child: Column(
        // shrinkWrap: true,
        children: [
          Container(
            width: 35.w,
            height: 21.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5.w)),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: .5.h,
          ),
          Text(
            amount,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black54),
          )
        ],
      ),
    );
  }
}