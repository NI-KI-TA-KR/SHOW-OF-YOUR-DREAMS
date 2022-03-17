import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:sneakears_shop/pages/cart/cart.dart';
import 'package:sneakears_shop/pages/cart/cart_bloc/cart_bloc.dart';
import 'package:sneakears_shop/utils/text_style.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CartPage(),
          ),
        );
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(3.5.w),
            child: Image.asset("assets/cart.png"),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.listOfCountSneakers != null) {
                return Positioned(
                  left: 7.w,
                  top: 2.w,
                  child: Container(
                    alignment: Alignment.center,
                    height: 5.w,
                    width: 5.w,
                    child: Text(
                      state.listOfCountSneakers!.length.toString(),
                      style: SneackersTextStyle.title
                          .copyWith(color: Colors.white),
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
