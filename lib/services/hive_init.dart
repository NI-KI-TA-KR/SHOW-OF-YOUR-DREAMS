import 'package:hive_flutter/adapters.dart';
import 'package:sneakears_shop/data/DB/sneakers_cart_db.dart';
import 'package:sneakears_shop/data/DB/sneakers_viewed_db.dart';
import 'package:sneakears_shop/data/models/price.dart';

class HiveHelper{
  factory HiveHelper() => _instance;

  HiveHelper._internal();

  static final HiveHelper _instance = HiveHelper._internal();

    Future<void> init() async {
      await Hive.initFlutter();
      await adapterViewedSneakers();
      await adapterSneakersCart();
      await adapterPrice();
    }

  static Future<void> adapterViewedSneakers() async {
    try {
      Hive.registerAdapter(SneakersViewedAdapter());
    } catch (e) {
      throw Exception(e);
    }
  }

    static Future<void> adapterSneakersCart() async {
    try {
      Hive.registerAdapter(SneakersCartAdapter());
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> adapterPrice() async {
    try {
      Hive.registerAdapter(PriceAdapter());
      Hive.registerAdapter(CurrencyAdapter());
    } catch (e) {
      throw Exception(e);
    }
  }
}
