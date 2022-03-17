import 'package:flutter/material.dart';
import 'package:sneakears_shop/data/models/colour.dart';

extension ColourToColor on Colour{
  Color toColor(){
    switch (this) {
      case Colour.blue:
        return Colors.blue;
      case Colour.black:
        return Colors.black;
      case Colour.green:
        return Colors.green;
      case Colour.purple:
        return Colors.purple;
      case Colour.yellow:
        return Colors.yellow;
      default: 
        return Colors.white;
    }
  }
}