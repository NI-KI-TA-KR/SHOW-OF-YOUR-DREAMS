import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakears_shop/data/DB/DB_cart.dart';
import 'package:sneakears_shop/data/DB/sneakers_cart_db.dart';
import 'package:sneakears_shop/data/models/sneakers.dart';
import 'package:sneakears_shop/data/repository/sneakers_repository.dart';
import 'package:sneakears_shop/locator.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  CartBloc() : super(CartState()){
    on<CartEvent>((event, emit) async{
      bool isEmpty = await DBCart().isEmpty;
      if(!isEmpty){
          final List<SneakersCart> sneakersCart  = await DBCart().values;
          final List<Sneakers> listOfsneakers = await sl<SneakersRepository>().getSneakers();

          List<CountSneakers> result = sneakersCart.map((sneakersCart){
            Sneakers sneakers = listOfsneakers.firstWhere((element) => element.id == sneakersCart.id);
            return CountSneakers(count: sneakersCart.count, sneakers: sneakers);
          }).toList();

          emit(CartState(listOfCountSneakers: result));
      } else{
        emit(CartState());
      }
    });
    }
 }


class CartEvent{}

class CartState{
  CartState({
    this.listOfCountSneakers
  });

  final List<CountSneakers>? listOfCountSneakers;
}

class CountSneakers{
  CountSneakers({
    required this.sneakers,
    required this.count
  });

  final Sneakers sneakers;
  final int count;
}