import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/common/widgets/custom_error_widget.dart';
import 'package:news_application/common/widgets/loading_widget.dart';
import 'package:news_application/news/model_view/news_provider.dart';
import 'package:news_application/news/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  final String selectedSourceId;
  const NewsList({super.key, required this.selectedSourceId});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late NewsProvider newsProvider;
  @override
  void initState() {
    super.initState();
    newsProvider = NewsProvider();
    newsProvider.getNews(widget.selectedSourceId);
  }

  @override
  void didUpdateWidget(covariant NewsList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    newsProvider.getNews(widget.selectedSourceId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      child: ListView(
        children: [
          ChangeNotifierProvider(
            create: (_) => newsProvider,
            child: Consumer<NewsProvider>(builder: (_, value, child) {
              return value.waiting
                  ? LoadingWidget()
                  : value.errorMessage != null
                      ? CustomErrorWidget(
                          errorMessage:
                              value.errorMessage ?? "someThing went wrong")
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.news?.length,
                          itemBuilder: (context, index) =>
                              NewsCard(artical: value.news![index]),
                        );
            }),
          )
        ],
      ),
    );
  }
}
