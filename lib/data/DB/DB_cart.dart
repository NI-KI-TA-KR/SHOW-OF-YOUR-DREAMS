// ignore_for_file: file_names

import 'dart:async';
import 'package:sneakears_shop/data/DB/sneakers_cart_db.dart';
import 'package:hive/hive.dart';
import 'package:sneakears_shop/data/models/price.dart';

class DBCart{
  factory DBCart() => _instance;
  DBCart._internal(){
    streamOfAllPrice();
  }
  static final DBCart _instance = DBCart._internal();
  
  Future<Box<SneakersCart>> get box => Hive.openBox<SneakersCart>('cart_storage');

  final StreamController<Price> _streamController = StreamController.broadcast();
  Stream<Price> get stream => _streamController.stream.asBroadcastStream();

  Future<void> add(int id, int count, Price price) async{
    final Box<SneakersCart> boxDB = await box;
    final SneakersCart? sneakersCart =  boxDB.get(id);
    if(sneakersCart != null){
      sneakersCart
        ..count = count
        ..save();
    } else{
      await boxDB.put(id, SneakersCart(id: id, count: count, price: price));
    }
  }

  Future<void> remove(int key) async{
    final Box<SneakersCart> boxDB = await box;
    await boxDB.delete(key);
  }

  Future<bool> get isEmpty async{
    final Box<SneakersCart> boxDB = await box;
    return boxDB.isEmpty;
  }

  Future<List<SneakersCart>> get values async{
    final Box<SneakersCart> boxDB = await box;
    List<SneakersCart> list = boxDB.values.map((e) => e).toList();
    return list;
  }

  Future<void> streamOfAllPrice() async{
    final Box<SneakersCart> boxDB = await box;
    
    boxDB.watch().listen((BoxEvent event) async{
      List<SneakersCart> list = boxDB.values.map((e) => e).toList();

      Price price = Price(currency: Currency.GBP, amount: 0);
      
      for (var cart in list) {
        price.addPriceAndCount(cart.price, cart.count);
      }

      _streamController.add(price);
    });
  }



}