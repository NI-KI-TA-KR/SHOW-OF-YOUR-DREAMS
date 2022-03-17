// ignore_for_file: file_names

import 'package:sneakears_shop/data/models/sneakers.dart';

extension ListGetBrandName on List<Sneakers>{
  List<String> get listOfBrands{
    List<String> brands = [];

    for (Sneakers sneakers in this) {
      if(!brands.contains(sneakers.brandName)){
        brands.add(sneakers.brandName);
      }
    }

    return brands;
  }
}
