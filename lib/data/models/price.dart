import 'package:hive/hive.dart';
import 'package:sneakears_shop/data/extensions/string_to_currency.dart';

part 'price.g.dart';

@HiveType(typeId: 2)
class Price extends HiveObject{
  Price({
    required this.currency,
    required this.amount,
    });

  @HiveField(0)
  final Currency currency;

  @HiveField(1)
  double amount;

  factory Price.fromJson(Map<String, dynamic> json){
    return Price(
      amount: double.parse(json['amount']),
      currency: json['currency'].toString().toCurrency()
    );
  }

  @override
  String toString() {
    return "${amount.toInt()} ${currency.toStr()}";
  }

  String toStringFromCount(int count){
    return "${amount.toInt() * count} ${currency.toStr()}";
  }

  void addPriceAndCount(Price price, int count){
    if(price.currency == currency){
      amount+=(price.amount * count);
    }
  }
  
}
@HiveType(typeId: 3)
enum Currency{

  @HiveField(0)
  // ignore: constant_identifier_names
  GBP, 

  @HiveField(1)
  none
}

extension CurrencyToString on Currency{
  String toStr(){
    switch (this) {
      case Currency.GBP:
        return "GBP";
      default:
        return "none";
    }
  }
}