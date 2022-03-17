import 'package:sneakears_shop/data/models/price.dart';

extension StringToCurrency on String{
  Currency toCurrency(){
    switch (this) {
      case "GBP":
        return Currency.GBP;
      default: 
        return Currency.none;
    }
  }
}