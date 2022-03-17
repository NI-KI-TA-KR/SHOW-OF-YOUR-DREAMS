import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:sneakears_shop/data/DB/DB_cart.dart';
import 'package:sneakears_shop/data/models/price.dart';
import 'package:sneakears_shop/pages/cart/cart_bloc/cart_bloc.dart';
import 'package:sneakears_shop/pages/cart/widgets/sneakers_cart_widget.dart';
import 'package:sneakears_shop/utils/text_style.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          "YOUR SHOES - YOUR CART",
          style: SneackersTextStyle.title24.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.listOfCountSneakers != null) {
            return stateListOfCart(state.listOfCountSneakers!);
          } else {
            return Center(
              child: Text(
                "Empty",
                style: GoogleFonts.bangers().copyWith(fontSize: 20.sp),
              ),
            );
          }
        },
      ),
    );
  }

  Widget stateListOfCart(List<CountSneakers> countSneakers) {
    return Column(
      children: [
        Container(
          height: 75.h,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: countSneakers
                  .map((element) => SneakersCartWidget(countSneakers: element))
                  .toList(),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5.w, 10.w, 5.w, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<Price>(
                  stream: DBCart().stream,
                  builder: (context, snapshot) {
                    return Text(
                      "Price All: ${snapshot.data.toString()}",
                      style: SneackersTextStyle.title24,
                    );
                  }),
              TextButton(
                onPressed: () {},
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
                    "BUY",
                    style: GoogleFonts.bangers()
                        .copyWith(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
