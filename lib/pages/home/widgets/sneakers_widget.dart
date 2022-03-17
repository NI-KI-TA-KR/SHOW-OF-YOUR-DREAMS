import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:sneakears_shop/data/DB/DB_viewed.dart';
import 'package:sneakears_shop/data/models/sneakers.dart';
import 'package:sneakears_shop/pages/home/viewed_bloc/viewed_bloc.dart';
import 'package:sneakears_shop/pages/sneakers_info/sneakers_info.dart';

class SneakersListWidget extends StatelessWidget {
  const SneakersListWidget({
    Key? key,
    required this.listOfSneakers,
  }) : super(key: key);

  final List<Sneakers> listOfSneakers;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: listOfSneakers.map((sneakers) => SneakersWidget(sneakers: sneakers)).toList(),
        ),
      ),
    );
  }
}

class SneakersWidget extends StatelessWidget {
  const SneakersWidget({
    Key? key,
    required this.sneakers,
  }) : super(key: key);

  final Sneakers sneakers;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        DBViewed().add(sneakers.id);
        context.read<ViewedBloc>().add(ViewedEvent());
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => SneakersInfo(sneakers: sneakers),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 2.h),
        padding: EdgeInsets.all(5.w),
        height: 24.h,
        child: Column(
          children: [
            Text(sneakers.name, style: GoogleFonts.bangers().copyWith(fontSize: 16.sp),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(2.w),
                  //padding: EdgeInsets.all(1.w),
                  child: Image.network(sneakers.urlMainImage, width: 30.w, height: 28.w),
                ),
                Text(
                  sneakers.price.toString(),
                  style: GoogleFonts.bangers().copyWith(
                    fontSize: 20.sp
                  ),
                ),
              ],
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
      ),
    );
  }
}
