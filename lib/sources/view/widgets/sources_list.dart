import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/common/theme/app_colors.dart';

class SourcesList extends StatefulWidget {
  const SourcesList({super.key});

  @override
  State<SourcesList> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList> {
  int selectedId = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(itemCount: 12,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: ChoiceChip(
            label: const Text("BBC"),
            padding:EdgeInsets.only(left:10.w,right: 10.w,bottom: 20.h ),
            showCheckmark: false,
            selectedColor: AppColors.mainGreen,
            labelStyle: TextStyle(
                color: index == selectedId ? Colors.white : AppColors.mainGreen,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
            
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27.r),
                side: BorderSide(color: AppColors.mainGreen)),
            selected: index == selectedId,
            onSelected: (value) {
              selectedId = index;
              setState(() {});
            },
          ),
        );
      }),
    );
  }
}
