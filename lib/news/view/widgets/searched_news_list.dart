import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/common/widgets/custom_error_widget.dart';
import 'package:news_application/common/widgets/loading_widget.dart';
import 'package:news_application/news/model_view/news_provider.dart';
import 'package:news_application/news/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class SearchedNewsList extends StatefulWidget {
  final String categoryId;

  const SearchedNewsList({super.key, required this.categoryId});

  @override
  State<SearchedNewsList> createState() => _NewsListState();
}

class _NewsListState extends State<SearchedNewsList> {
  ScrollController scrollController = ScrollController();
  int pageNo = 1;
  bool isLoadingMore = false;
  late NewsProvider newsProvider;
  double previousOffset = 0;
  @override
  void initState() {
    super.initState();
    newsProvider = NewsProvider();
    print("in the search tab");
    newsProvider.searchNews(widget.categoryId,
        " The best Black Friday deals we’re seeing on Macbooks and other laptops");
    scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (isLoadingMore) return;
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoadingMore) {
      setState(() {
        isLoadingMore = true;
        pageNo++;
        previousOffset = scrollController.offset;
      });
      await newsProvider
          .searchNews(widget.categoryId,
              " The best Black Friday deals we’re seeing on Macbooks and other laptops")
          .then((_) {
        setState(() => isLoadingMore = false);
      });
      scrollController.jumpTo(previousOffset);
    }
  }

  @override
  void didUpdateWidget(covariant SearchedNewsList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    newsProvider.searchNews(widget.categoryId, 
        " The best Black Friday deals we’re seeing on Macbooks and other laptops");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      child: ListView(
        controller: scrollController,
        children: [
          ChangeNotifierProvider(
            create: (_) => newsProvider,
            child: Consumer<NewsProvider>(builder: (_, value, child) {
              print(value.news);
              return value.waiting
                  ? const LoadingWidget()
                  : value.errorMessage != null
                      ? CustomErrorWidget(
                          errorMessage:
                              value.errorMessage ?? "someThing went wrong")
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              value.news!.length + (isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == value.news!.length) {
                              return const LoadingWidget(); // Show loading indicator at the bottom
                            }
                            return NewsCard(article: value.news![index]);
                          });
            }),
          )
        ],
      ),
    );
  }
}
