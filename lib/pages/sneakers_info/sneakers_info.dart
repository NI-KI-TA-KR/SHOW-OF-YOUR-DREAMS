import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:sneakears_shop/data/DB/DB_cart.dart';
import 'package:sneakears_shop/data/extensions/colour_to_color.dart';
import 'package:sneakears_shop/data/extensions/stockstatus_ex.dart';
import 'package:sneakears_shop/data/models/sneakers.dart';
import 'package:sneakears_shop/pages/cart/cart.dart';
import 'package:sneakears_shop/pages/cart/cart_bloc/cart_bloc.dart';
import 'package:sneakears_shop/pages/cart/widgets/card_icon_widget.dart';
import 'package:sneakears_shop/utils/text_style.dart';

class SneakersInfo extends StatelessWidget {
  const SneakersInfo({
    Key? key,
    required this.sneakers,
  }) : super(key: key);

  final Sneakers sneakers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "of your dreams",
          style: GoogleFonts.bangers()
              .copyWith(fontSize: 24.sp, color: Colors.black),
        ),
        actions: const [CardIcon()],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 78.h,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(5.w, 2.w, 5.w, 2.w),
                child: Column(
                  children: [
                    Text(
                      sneakers.name,
                      style: GoogleFonts.bangers()
                          .copyWith(fontSize: 23.sp, color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.w),
                      child: Image.network(
                        sneakers.urlMainImage,
                        height: 35.h,
                      ),
                    ),
                    Text(
                      sneakers.description,
                      style: GoogleFonts.bangers().copyWith(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Brand: ${sneakers.brandName}",
                            style: GoogleFonts.bangers().copyWith(
                              color: Colors.black,
                              fontSize: 20.sp,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Color:",
                                style: GoogleFonts.bangers().copyWith(
                                    color: Colors.black, fontSize: 20.sp),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                height: 10.w,
                                width: 10.w,
                                decoration: BoxDecoration(
                                  color: sneakers.colour.toColor(),
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.w)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5.w),
                      child: Row(
                        children: [
                          Text(
                            "Sizes:",
                            style: GoogleFonts.bangers()
                                .copyWith(color: Colors.black, fontSize: 20.sp),
                          ),
                          SizesWidget(
                            sizes: sneakers.sizes,
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 5.w),
                      child: Text(
                        sneakers.stockStatus.toStr(),
                        style: GoogleFonts.bangers().copyWith(
                            color: sneakers.stockStatus.toColor(),
                            fontSize: 30.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price: ${sneakers.price.toString()}",
                  style: GoogleFonts.bangers()
                      .copyWith(color: Colors.black, fontSize: 24.sp),
                ),
                TextButton(
                  onPressed: () {
                    DBCart().add(sneakers.id, 1, sneakers.price);
                    context.read<CartBloc>().add(CartEvent());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 1.w, 3.w, 1.w),
                    child: Text(
                      "Add to Card",
                      style: GoogleFonts.bangers()
                          .copyWith(color: Colors.white, fontSize: 20.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SizesWidget extends StatelessWidget {
  const SizesWidget({
    Key? key,
    required this.sizes,
  }) : super(key: key);

  final List<String> sizes;

  List<Widget> _buildList() {
    return sizes.map((size) => buildSizeWidget(size)).toList();
  }

  Widget buildSizeWidget(String size) {
    return Container(
      margin: EdgeInsets.all(2.w),
      padding: EdgeInsets.fromLTRB(3.w, 2.w, 3.w, 2.w),
      child: Text(
        size,
        style: SneackersTextStyle.title18.copyWith(color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(5.w)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildList(),
    );
  }
}
