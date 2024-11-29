import 'package:flutter/material.dart';
import 'package:news_application/common/widgets/custom_error_widget.dart';
import 'package:news_application/common/widgets/loading_widget.dart';
import 'package:news_application/sources/view/widgets/sources_list.dart';
import 'package:news_application/sources/view_model/sources_provider.dart';
import 'package:provider/provider.dart';

class CategoryNews extends StatefulWidget {
  final String id;
  final bool searching;
  const CategoryNews({super.key, required this.id, required this.searching});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  late SourcesProvider sourcesProvider;

  @override
  void initState() {
    super.initState();
    sourcesProvider = SourcesProvider();
    sourcesProvider.getSources(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListView(children: [
        ChangeNotifierProvider(
          create: (BuildContext context) => sourcesProvider,
          child: Consumer<SourcesProvider>(builder: (context, value, child) {
            return value.waiting
                ? const LoadingWidget()
                : sourcesProvider.errorMessage != null
                    ? CustomErrorWidget(
                        errorMessage: sourcesProvider.errorMessage!,
                      )
                    : SourcesList(sourcesList: value.sources ?? [],searching: widget.searching,);
          }),
        )
      ]);
    });
  }
}
