import 'package:sneakears_shop/data/models/sneakers.dart';

extension ListFromId on List<Sneakers>{
  List<Sneakers> toListFromId(List<int> listOfId){
    List<Sneakers> result = [];
    
    for (var id in listOfId){
      for (var sneakers in this){
        if(sneakers.id == id){
          result.add(sneakers);
        }
      }
    }
    
    return result;
  }
}