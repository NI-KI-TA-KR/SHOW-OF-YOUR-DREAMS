import 'package:flutter/material.dart';

class SizesWidget extends StatelessWidget{
  const SizesWidget({Key? key,
    required this.sizes,
    required this.onValueChanged,
  }) : super(key: key);

  final List<String> sizes;
  final ValueChanged<String> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(),
    );
  }

  List<Widget> buildList(){
    return sizes.map((size) => Text(size)).toList();
  }
  
}