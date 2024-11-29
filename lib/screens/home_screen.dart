import 'package:flutter/material.dart';
import 'package:news_application/common/widgets/custom_drawer.dart';
import 'package:news_application/common/widgets/custom_search_bar.dart';
import 'package:news_application/news/view/widgets/searched_news_list.dart';
import 'package:news_application/screens/categories/category_news.dart';
import 'package:news_application/settings/view/settings_view.dart';
import 'package:news_application/sources/data/models/category_model.dart';
import 'package:news_application/sources/view/category_view.dart';
import 'package:news_application/sources/view/widgets/sources_list.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItems selectedView = DrawerItems.categories;
  CategoryModel? selectedCategory;
  bool isSearchClicked = false;
  bool finished=false;
  TextEditingController searchBarController = TextEditingController();
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
            centerTitle: isSearchClicked ? false : true,
            title: selectedCategory != null && isSearchClicked
                ? CustomSearchBar(
                    controller: searchBarController,
                    closedClicked: () => setState(() {
                          isSearchClicked = false;
                          print("close");
                        }),
                    searchClicked: () => setState(() {
                          isSearchClicked = true;
                          finished=true;
                          print("search");
                        }))
                : selectedCategory != null
                    ? Text(selectedCategory?.title ?? "category")
                    : const Text("News App"),
            actions: [
              if (selectedCategory != null && !isSearchClicked)
                IconButton(
                    onPressed: () {
                      setState(() {
                        isSearchClicked = true;
                        print(isSearchClicked);
                      });
                    },
                    icon: const Icon(Icons.search))
            ],
          ),
          drawer: CustomDrawer(
            onSelect: (drawerItem) {
              selectedView = drawerItem;
              selectedCategory = null;
              setState(() {});
            },
          ),
          body: selectedCategory != null
              ? isSearchClicked&& finished
                  ? SearchedNewsList(categoryId: selectedCategory?.id??"",searchText:searchBarController.text)
                  : CategoryNews(
                      id: selectedCategory?.id ?? "", searching: true)
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
