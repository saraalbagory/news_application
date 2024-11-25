import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/sources/data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
              //even
              bottomLeft:
                  categoryModel.isRight ? const Radius.circular(25) : Radius.zero,
              bottomRight: categoryModel.isRight
                  ? Radius.zero
                  : const Radius.circular(25))),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            categoryModel.image,
            height: 120.h,
            fit: BoxFit.contain,
          ),
          Text(
            categoryModel.title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.h,
                fontWeight: FontWeight.w400),
          ),
          // const SizedBox(
          //   height: 10,
          // )
        ],
      ),
    );
  }
}
