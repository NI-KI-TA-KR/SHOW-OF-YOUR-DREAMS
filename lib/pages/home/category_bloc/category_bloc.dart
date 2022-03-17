import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState>{
  CategoryBloc() : super(CategoryState(category: "All")){
    on<CategoryEvent>((event, emit){
      emit(CategoryState(category: event.category));
    });
  }
}

class CategoryEvent{
  CategoryEvent({
    required this.category
  });

  final String category;
}

class CategoryState{
  CategoryState({
    required this.category,
  });

  final String category;
}