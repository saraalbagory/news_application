import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/common/theme/app_colors.dart';
import 'package:news_application/common/theme/app_theme.dart';
import 'package:news_application/news/data/models/artical_model.dart';
import 'package:news_application/news/view/screens/news_details.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  final ArticalModel article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, NewsDetails.routeName,
          arguments: article!),
      child: Container(
          padding: EdgeInsets.all(15.w),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(20.w),
          height: 360.h,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CachedNetworkImage(
                height: 230.h,
                width: double.infinity,
                fit: BoxFit.contain,
                imageUrl: article.urlToImage ?? "",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.asset(
                      "assets/images/errorsImage.jpg",
                      height: 230.h,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    )),
            SizedBox(
              height: 10.h,
            ),
            Text(
              article.author ?? "",
              style: TextStyle(color: AppColors.textGrey, fontSize: 10.sp),
            ),
            Text(
              article.title ?? "",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            if (article.publishedAt != null)
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  timeago.format(DateTime.parse(article.publishedAt!)),
                  style: TextStyle(
                      color: AppColors.textLightGrey, fontSize: 11.sp),
                ),
              ),
            SizedBox(
              height: 10.h,
            )
          ])),
    );
  }
}
