import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/common/theme/app_colors.dart';
import 'package:news_application/news/view/widgets/news_list.dart';
import 'package:news_application/sources/data/models/sources_list_model.dart';

class SourcesList extends StatefulWidget {
  final List<Sources> sourcesList;
  const SourcesList( {super.key, required this.sourcesList});

  @override
  State<SourcesList> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList> {
  int selectedId = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
          child: ListView.builder(
              itemCount: widget.sourcesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: ChoiceChip(
                    label: Text(widget.sourcesList[index].name ?? ""),
                    padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
                    showCheckmark: false,
                    selectedColor: AppColors.mainGreen,
                    labelStyle: TextStyle(
                        color: index == selectedId
                            ? Colors.white
                            : AppColors.mainGreen,
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
        ),
        if(selectedId!=null) NewsList(selectedSourceId: widget.sourcesList[selectedId].id!)
        
      ],
    );
  }
}
