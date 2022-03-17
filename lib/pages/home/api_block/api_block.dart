import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakears_shop/data/extensions/list_get_brandName.dart';
import 'package:sneakears_shop/data/models/sneakers.dart';
import 'package:sneakears_shop/data/repository/sneakers_repository.dart';
import 'package:sneakears_shop/locator.dart';
import 'package:sneakears_shop/pages/home/api_block/api_event.dart';
import 'package:sneakears_shop/pages/home/api_block/api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState>{
  ApiBloc() : super(ApiProgressState()){
    on<ApiInitializeEvent>((event, emit) async{
      try{
        emit(ApiProgressState());
        final List<Sneakers> sneakers = await sl<SneakersRepository>().getSneakers();
        emit(ApiSuccessState(sneakers: sneakers, brandNames:  sneakers.listOfBrands));
      } catch(_){
        emit(ApiErrorState());
      }
    });
    on<ApiFindBrandEvent>((event, emit) async{
      emit(ApiProgressState());
      try{
        final List<Sneakers> sneakers = await sl<SneakersRepository>().getSneakers();
        final List<Sneakers> result = [];

        for (var element in sneakers) {
          if(element.brandName == event.brandName){
            result.add(element);
          }
        }

        emit(ApiSuccessState(sneakers: result, brandNames: sneakers.listOfBrands));
      } catch(_){
        emit(ApiErrorState());
      }
    });
  }
}