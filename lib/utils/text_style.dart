import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


class SneackersTextStyle{
  SneackersTextStyle._();

  static TextStyle title = GoogleFonts.bangers();

  static  TextStyle title16 = title.copyWith(fontSize: 16.sp); 
  static  TextStyle title18 = title.copyWith(fontSize: 18.sp);
  static  TextStyle title24 = title.copyWith(fontSize: 24.sp);
}