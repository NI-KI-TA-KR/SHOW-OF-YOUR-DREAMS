import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:sneakears_shop/data/extensions/list_get_snickers_from_id.dart';
import 'package:sneakears_shop/data/models/sneakers.dart';
import 'package:sneakears_shop/pages/cart/widgets/card_icon_widget.dart';
import 'package:sneakears_shop/pages/home/api_block/api_block.dart';  
import 'package:sneakears_shop/pages/home/api_block/api_state.dart';
import 'package:sneakears_shop/pages/home/viewed_bloc/viewed_bloc.dart';
import 'package:sneakears_shop/pages/home/widgets/category_widget.dart';
import 'package:sneakears_shop/pages/home/widgets/sneakers_widget.dart';
import 'package:sneakears_shop/pages/home/widgets/viewed_products_widget.dart';
import 'package:sneakears_shop/utils/text_style.dart';


class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Shoes of your dreams", style: GoogleFonts.bangers().copyWith(fontSize: 24.sp, color: Colors.black),),
        actions: const [
          CardIcon()
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state){
          if(state is ApiProgressState){
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );

          } else if(state is ApiSuccessState){
            return BlocBuilder<ViewedBloc, ViewedState>(
              builder: (context, stateViewed) {
                return progressStateWidget(state.sneakers, state.brandNames, stateViewed.idViewed);
              }
            );
          } else if(state is ApiErrorState){
            return Center(
              child: Text("Error with Internet", style: SneackersTextStyle.title24,),
            );
          } else {
            return Container();
          }
        }
      ),
    );
  }

  Widget progressStateWidget(List<Sneakers> listOfSneakers, List<String> brandNames, List<int>? idViewed){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          CategoriesWidget(
            brands: brandNames,
          ),
          SizedBox(
            height: idViewed != null ? 55.h : 80.h,
            child: SneakersListWidget(listOfSneakers: listOfSneakers),
          ),
          idViewed != null ?
          Container(
            margin: EdgeInsets.only(top: 5.w),
            child: Text("Recently viewed products", style: GoogleFonts.bangers().copyWith(fontSize: 20.sp, color: Colors.black),),
          ): Container(),
          idViewed != null ?
          ViewedWidget(viewedSneakers: listOfSneakers.toListFromId(idViewed),) : Container()
        ],
      ),
    );
  }
}