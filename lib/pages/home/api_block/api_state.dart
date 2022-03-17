import 'package:sneakears_shop/data/models/sneakers.dart';

abstract class ApiState{}

class ApiSuccessState extends ApiState{
  ApiSuccessState({
    required this.sneakers,
    required this.brandNames,
    this.idViewed
  });

  final List<Sneakers> sneakers;
  final List<String> brandNames;
  final List<int>? idViewed;
}

class ApiProgressState extends ApiState{}

class ApiErrorState extends ApiState{}