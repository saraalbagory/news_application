import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/news/data/models/artical_model.dart';
import 'package:news_application/news/view/widgets/news_card.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  static const String routeName = "newsDetails";

  const NewsDetails({
    super.key,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  void _launchURL(Uri uri) async {
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ArticalModel? articalModel =
        ModalRoute.of(context)!.settings.arguments as ArticalModel?;
    return Container(
        decoration: const BoxDecoration(
            //designSize:DecorationImage(image: image)
            image:
                DecorationImage(image: AssetImage("assets/images/pattern.png")),
            color: Colors.white),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(articalModel?.title ?? "news title"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            if(articalModel!=null)  NewsCard(article: articalModel),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: 360.w,
                height: 237.h,
                child: Text(
                  articalModel?.description ?? "",
                  style:
                      TextStyle(fontWeight: FontWeight.w300, fontSize: 13.sp),
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () => _launchURL(Uri.parse(articalModel?.url??'')),
                    label: Text(
                      "View Full Article",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14.sp),
                    ),
                    icon: const Icon(Icons.navigate_next_rounded),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
