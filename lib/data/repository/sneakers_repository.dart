import 'dart:convert';

import 'package:sneakears_shop/config.dart';
import 'package:sneakears_shop/data/models/sneakers.dart';
import 'package:http/http.dart' as http;

abstract class SneakersRepository{
  Future<List<Sneakers>> getSneakers();
}

class SneakersRepositoryImpl implements SneakersRepository{
  @override
  Future<List<Sneakers>> getSneakers() async{
    final Uri uri = Uri.parse(Endpoint.dataApi);
    final response = await http.get(uri);

    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map<Sneakers>((json) => Sneakers.fromJson(json)).toList();
    } 
    throw Exception("Error! Status code ${response.statusCode}");
  }
}