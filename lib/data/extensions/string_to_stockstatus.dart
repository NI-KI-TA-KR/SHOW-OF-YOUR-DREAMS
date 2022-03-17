import 'package:sneakears_shop/data/models/stockstatus.dart';

extension StringToStockStatus on String{
  StockStatus toStockStatus(){
    switch (this) {
      case "IN STOCK":
        return StockStatus.inStock;
      default:
        return  StockStatus.soldOut;
    }
  }
}