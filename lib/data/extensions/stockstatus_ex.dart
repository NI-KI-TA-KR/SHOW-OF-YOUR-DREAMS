import 'package:flutter/material.dart';
import 'package:sneakears_shop/data/models/stockstatus.dart';

extension StockStatusExtension on StockStatus{
  String toStr(){
    switch (this) {
      case  StockStatus.inStock:
        return "In Stock";
      default: 
        return "Sold out";
    }
  }
  
  Color toColor(){
    switch (this) {
      case  StockStatus.inStock:
        return Colors.green;
      case StockStatus.soldOut:
        return Colors.black;
    }
  }
}