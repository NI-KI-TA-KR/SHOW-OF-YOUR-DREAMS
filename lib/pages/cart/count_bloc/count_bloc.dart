import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakears_shop/data/DB/DB_cart.dart';
import 'package:sneakears_shop/data/DB/sneakers_cart_db.dart';

class CountBloc extends Bloc<CountEvent, CountState>{
  CountBloc(int id) : super(CountState(count: 1)){
    on<CountEvent>(((event, emit) async{
      final List<SneakersCart> sneakersCart  = await DBCart().values;
      final SneakersCart element = sneakersCart.firstWhere((e) => e.id == id);

      switch (event) {
        case CountEvent.add:
          element.count++;
          break;
        case CountEvent.substract:
          if(element.count != 1){
            element.count--;
          }
          break;
        default: break;
      }

      element.save();
      emit(CountState(count: element.count));
    }));
  }
}

enum CountEvent{add, substract, value}

class CountState{
  CountState({this.count});
  final int? count;
}