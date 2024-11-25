import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/common/theme/app_colors.dart';
import 'package:news_application/common/theme/app_theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onSelect});
  final Function(DrawerItems) onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 362.w,
      child: Column(
        children: [
          Container(
            height: 110.h,
            color: AppColors.mainGreen,
            alignment: Alignment.center,
            child: const Text(
              "News App!",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.list,
              size: 30,
            ),
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 24.sp),
            title: const Text("Categories"),
            onTap: () {
              onSelect(DrawerItems.categories);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 24.sp),
            title: const Text("Settings"),
            onTap: () {
              onSelect(DrawerItems.settings);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

  }
  
}
enum DrawerItems{
  settings,categories
}