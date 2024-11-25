import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/common/theme/app_colors.dart';
import 'package:news_application/sources/view/widgets/category_card.dart';
import 'package:news_application/sources/data/models/category_model.dart';

class CategoryView extends StatelessWidget {
  final Function(CategoryModel category) onChoosingCategory;
  const CategoryView({super.key, required this.onChoosingCategory});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          id: 'sports',
          image: "assets/images/sports.png",
          title: 'Sports',
        backgroundColor: Colors.red),
      CategoryModel(
          id: 'health',
          image: "assets/images/sports.png",
          title: 'Health',
          backgroundColor: const Color(0xffED1E79)),
      CategoryModel(
          id: 'business',
          image: "assets/images/sports.png",
          title: 'Business',
          backgroundColor: const Color(0xffCF7E48)),
      CategoryModel(
          id: 'science',
          image: "assets/images/sports.png",
          title: 'Science',
          backgroundColor: const Color(0xffF2D352))
    ];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Pick your category of interest",
            style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textGrey),
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 170.h,
                crossAxisSpacing: 25.w,
                mainAxisSpacing: 20.h,
              ),
              itemBuilder: (context, index) {
                categories[index].setRight=index%2==0;
                return GestureDetector(
                  onTap: ()=> onChoosingCategory(categories[index]),
                  child: CategoryCard(
                      categoryModel: categories[index]),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
  

}
