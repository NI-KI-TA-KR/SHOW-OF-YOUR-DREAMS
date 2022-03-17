import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:sneakears_shop/pages/cart/count_bloc/count_bloc.dart';
import 'package:sneakears_shop/utils/text_style.dart';
import 'dart:math' as math;

class CountWidget extends StatelessWidget {
  const CountWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountBloc, CountState>(builder: (context, state) {

      return Row(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: IconButton(
              onPressed: state.count! > 1
                  ? () {
                      context.read<CountBloc>().add(CountEvent.substract);
                    }
                  : null,
              icon: Icon(
                Icons.arrow_right,
                size: 10.w,
              ),
            ),
          ),
          Text(
            state.count.toString(),
            style: SneackersTextStyle.title16,
          ),
          IconButton(
            onPressed: () {
              context.read<CountBloc>().add(CountEvent.add);
            },
            icon: Icon(
              Icons.arrow_right,
              size: 10.w,
            ),
          ),
        ],
      );
    });
  }
}
