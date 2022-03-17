import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:sneakears_shop/locator.dart';
import 'package:sneakears_shop/pages/cart/cart_bloc/cart_bloc.dart';
import 'package:sneakears_shop/pages/home/api_block/api_block.dart';
import 'package:sneakears_shop/pages/home/api_block/api_event.dart';
import 'package:sneakears_shop/pages/home/category_bloc/category_bloc.dart';
import 'package:sneakears_shop/services/hive_init.dart';
import 'pages/home/home_page.dart';
import 'pages/home/viewed_bloc/viewed_bloc.dart';

void main() async{
  setup();
  await HiveHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ApiBloc()..add(ApiInitializeEvent()),
          ),
          BlocProvider(
            create: (_) => CategoryBloc(),
          ),
          BlocProvider(
            create: (_) => ViewedBloc()..add(ViewedEvent()),
          ),
          BlocProvider(
            create: (_) => CartBloc()..add(CartEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shoes your dreams',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
      );
    });
  }
}
