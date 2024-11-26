import 'package:flutter/material.dart';
import 'package:news_application/common/widgets/custom_drawer.dart';
import 'package:news_application/screens/categories/category_news.dart';
import 'package:news_application/settings/view/settings_view.dart';
import 'package:news_application/sources/data/models/category_model.dart';
import 'package:news_application/sources/view/category_view.dart';
import 'package:news_application/sources/view/widgets/sources_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItems selectedView = DrawerItems.categories;
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //designSize:DecorationImage(image: image)
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png")),
          color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("News App"),
        ),
        drawer: CustomDrawer(
          onSelect: (drawerItem) {
            selectedView = drawerItem;
            selectedCategory = null;
            setState(() {});
          },
        ),
        body: selectedCategory != null
              ? CategoryNews(id: selectedCategory?.id??"")
              : selectedView == DrawerItems.categories
                  ? CategoryView(
                      onChoosingCategory: (p0) {
                        selectedCategory = p0;
                        setState(() {});
                      },
                    )
                  : const SettingsView()),
      );

  }
}
