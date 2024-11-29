import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/common/theme/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function()? closedClicked;
  final void Function()? searchClicked;
  final TextEditingController controller;

  const CustomSearchBar(
      {super.key,
      this.closedClicked,
      this.searchClicked,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(25.h),
          border: Border.all(color: Colors.grey[300]!),
        ),
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: Row(
          children: [
            IconButton(
              onPressed: closedClicked,
              icon: const Icon(Icons.close),
              color: AppColors.mainGreen,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: searchClicked,
              icon: const Icon(Icons.search),
              color: AppColors.mainGreen,
            ),
          ],
        ));
  }
}
