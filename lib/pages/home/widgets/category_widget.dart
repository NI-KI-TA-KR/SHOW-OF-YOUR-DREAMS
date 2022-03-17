import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:sneakears_shop/pages/home/api_block/api_block.dart';
import 'package:sneakears_shop/pages/home/api_block/api_event.dart';
import 'package:sneakears_shop/pages/home/category_bloc/category_bloc.dart';
import 'package:sneakears_shop/typedef.dart';

class CategoriesWidget extends StatelessWidget{
  const CategoriesWidget({
    Key? key,
    required this.brands,
  }) : super(key: key);

  final List<String> brands;

  List<Widget> buildList(BuildContext context, String selectBrand){
    List<Widget> widgets = [];
    widgets.add(
      CategoryWidget(
        onTap: (){
          context.read<CategoryBloc>().add(CategoryEvent(category: "All"));
          context.read<ApiBloc>().add(ApiInitializeEvent());
        },
        title: "All",
        isSelect: selectBrand == "All",
      ),
    );

    for (var brand in brands) {
      widgets.add(
        CategoryWidget(
          onTap: (){
            context.read<CategoryBloc>().add(CategoryEvent(category: brand));
            context.read<ApiBloc>().add(ApiFindBrandEvent(brandName: brand));
          }, 
          title: brand,
          isSelect: selectBrand == brand,
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildList(context, state.category),
        );
      },
    );
  }
}

class CategoryWidget extends StatefulWidget{
  const CategoryWidget({
    Key? key,
    required this.onTap,
    required this.title,
    required this.isSelect
  }) : super(key: key);

  final OnTap onTap;
  final String title;
  final bool isSelect;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(5.w, 2.w, 5.w, 2.w),
        margin: EdgeInsets.all(2.w),
        child: Text(
          widget.title,
          style: GoogleFonts.bangers().copyWith(
            color: widget.isSelect ? Colors.white : Colors.black,
            fontSize: 15.sp,
          ),
        ),
        decoration: BoxDecoration(
          color: widget.isSelect ? Colors.black : Colors.white,
          
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          border: Border.all(color: Colors.black)
        ),
      ),
    );
  }
}