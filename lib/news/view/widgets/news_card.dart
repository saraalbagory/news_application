import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/common/theme/app_colors.dart';
import 'package:news_application/common/theme/app_theme.dart';
import 'package:news_application/news/data/models/artical_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  final ArticalModel artical;
  const NewsCard({super.key, required this.artical});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: EdgeInsets.all(20.w),
          height: 311.h,
          child: Column(children: [
            CachedNetworkImage(
                height: 230.h,
                width: double.infinity,
                fit: BoxFit.contain,
                imageUrl: artical.urlToImage ?? "",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.asset(
                      "assets/images/errorsImage.jpg",
                      height: 230.h,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Text(artical.author??"",style: TextStyle(color: AppColors.textGrey, fontSize: 10),),
                Text(artical.title??"", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),),
                if (artical.publishedAt != null)
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  timeago.format(DateTime.parse(artical.publishedAt!)),
                  style: TextStyle(color: AppColors.textLightGrey, fontSize: 13),
                ),
              ),
            SizedBox(
              height: 10.h,
            )
      
          
          ])),
    );
  }
}
