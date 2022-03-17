import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:sneakears_shop/data/models/sneakers.dart';

class ViewedWidget extends StatelessWidget{
  const ViewedWidget({
    Key? key,
    required this.viewedSneakers
  }) : super(key: key);

  final List<Sneakers> viewedSneakers;

  List<Widget> buildList(){
    return viewedSneakers.map((sneakers) => 
      SneackersViewedWidget(sneakers: sneakers)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: buildList(),
      ),
    );
  }
}

class SneackersViewedWidget extends StatelessWidget{
  const SneackersViewedWidget({
    Key? key,
    required this.sneakers,
  }) : super(key: key);

  final Sneakers sneakers;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.w),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(2.w),
            //padding: EdgeInsets.all(1.w),
            child: Image.network(sneakers.urlMainImage, width: 26.w, height: 26.w),
          ),
          Text(
            sneakers.price.toString(),
            style: GoogleFonts.bangers().copyWith(
              fontSize: 15.sp
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(7.w)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  } 
}