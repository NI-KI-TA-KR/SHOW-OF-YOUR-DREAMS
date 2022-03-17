import 'package:sneakears_shop/data/models/colour.dart';

extension StringToColour on String{
  Colour toColour(){
    switch (this) {
      case "blue":
        return Colour.blue;
      case "black":
        return Colour.black;
      case "purple":
        return Colour.purple;
      case "green":
        return Colour.green;
      case "yellow":
        return Colour.yellow;
      default: 
        return Colour.multicoloured;
    }
  }
}