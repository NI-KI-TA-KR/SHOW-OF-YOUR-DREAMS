import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakears_shop/data/DB/DB_viewed.dart';

class ViewedBloc extends Bloc<ViewedEvent, ViewedState>{
  ViewedBloc() : super(ViewedState()){
    on<ViewedEvent>(((event, emit) async{
      bool isEmpty = await DBViewed().isEmpty;
      if(!isEmpty){
          List<int> idViewed  = await DBViewed().values;
          emit(ViewedState(idViewed: idViewed));
      } else{
        emit(ViewedState());
      }
    }));
  }
}

class ViewedEvent{}

class ViewedState{
  ViewedState({
    this.idViewed,
  });

  final List<int>? idViewed;
}
