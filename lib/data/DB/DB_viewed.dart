// ignore_for_file: file_names

import 'package:sneakears_shop/data/DB/sneakers_viewed_db.dart';
import 'package:hive/hive.dart';


class DBViewed{
  factory DBViewed() => _instance;
  DBViewed._internal();
  static final DBViewed _instance = DBViewed._internal();
  
  Future<Box<SneakersViewed>> get box => Hive.openBox<SneakersViewed>('viewed_storage');

  Future<void> add(int id) async{
    final Box<SneakersViewed> boxDB = await box;
    final SneakersViewed? viewed =  boxDB.get(id);
    if(viewed != null){
      viewed
        ..dateTimeViewed = DateTime.now()
        ..save();
    } else{
      await boxDB.put(id, SneakersViewed(id: id, dateTimeViewed: DateTime.now()));
    }
  }

  Future<void> remove(int key) async{
    final Box<SneakersViewed> boxDB = await box;
    await boxDB.delete(key);
  }

  Future<bool> get isEmpty async{
    final Box<SneakersViewed> boxDB = await box;
    return boxDB.isEmpty;
  }

  Future<List<int>> get values async{
    final Box<SneakersViewed> boxDB = await box;
    List<SneakersViewed> list = boxDB.values.map((e) => e).toList();
    list.sort((a,b) => a.dateTimeViewed.compareTo(b.dateTimeViewed));
    List<int> result = [];

    for (var element in list.reversed) {
      if(DateTime.now().subtract(const Duration(hours: 24)).isBefore(element.dateTimeViewed)){
        result.add(element.id);
      } else{
        element.delete();
      }
    }

    return result;
  }
}