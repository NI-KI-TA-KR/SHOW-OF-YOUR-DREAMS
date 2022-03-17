import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:sneakears_shop/pages/cart/cart_bloc/cart_bloc.dart';
import 'package:sneakears_shop/pages/cart/count_bloc/count_bloc.dart';
import 'package:sneakears_shop/pages/cart/widgets/count_widget.dart';
import 'package:sneakears_shop/utils/text_style.dart';

class SneakersCartWidget extends StatelessWidget {
  const SneakersCartWidget({
    Key? key,
    required this.countSneakers,
  }) : super(key: key);

  final CountSneakers countSneakers;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountBloc>(
      create: (context) => CountBloc(countSneakers.sneakers.id)..add(CountEvent.value),
      child: Container(
        height: 22.h,
        width: 100.w,
        padding: EdgeInsets.all(3.w),
        margin: EdgeInsets.all(5.w),
        child: Column(
          children: [
            Text(
              countSneakers.sneakers.name,
              style: SneackersTextStyle.title16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  countSneakers.sneakers.urlMainImage,
                  height: 30.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CountWidget(
                            id: countSneakers.sneakers.id,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 1.w),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.cancel),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 5.w, top: 5.w),
                      child: BlocBuilder<CountBloc, CountState>(
                          builder: (context, state) {
                        return Text(
                          countSneakers.sneakers.price
                              .toStringFromCount(state.count!),
                          style: SneackersTextStyle.title18,
                        );
                      }),
                    ),
                  ],
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