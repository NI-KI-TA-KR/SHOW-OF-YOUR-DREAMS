import 'package:hive/hive.dart';
import 'package:sneakears_shop/data/models/price.dart';

part 'sneakers_cart_db.g.dart';

@HiveType(typeId: 1)
class SneakersCart extends HiveObject{
  SneakersCart({
    required this.id,
    required this.count,
    required this.price
  });

  @HiveField(0)
  final int id;

@HiveField(1)
  int count;

  @HiveField(2)
  Price price;
}