import 'package:sneakears_shop/data/extensions/string_to_colour.dart';
import 'package:sneakears_shop/data/extensions/string_to_stockstatus.dart';
import 'package:sneakears_shop/data/models/colour.dart';
import 'package:sneakears_shop/data/models/price.dart';
import 'package:sneakears_shop/data/models/stockstatus.dart';

class Sneakers {
  Sneakers({
    required this.id,
    required this.name,
    required this.brandName,
    required this.urlMainImage,
    required this.price,
    required this.sizes,
    required this.colour,
    required this.description,
    required this.stockStatus,
  });

  final int id;
  final String name;
  final String brandName;
  final String urlMainImage;
  final Price price;
  final List<String> sizes;
  final Colour colour;
  final String description;
  final StockStatus stockStatus;

  factory Sneakers.fromJson(Map<String, dynamic> json){
    return Sneakers(
      id: int.parse(json['id']),
      name: json['name'],
      brandName: json['brandName'],
      urlMainImage: json['mainImage'],
      price: Price.fromJson(json['price']),
      sizes: (json['sizes'] as List).map((e) => e.toString()).toList(),
      colour: json['colour'].toString().toColour(),
      description: json['description'],
      stockStatus: json['stockStatus'].toString().toStockStatus(),
    );
  }
  
}
