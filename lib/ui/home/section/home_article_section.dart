import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_donor/models/news_model.dart';
import 'package:flutter_donor/ui/home/widgets/article_tile_widget.dart';
import 'package:html/parser.dart';
import '../../../get_x/controller/news_controller.dart';
import 'package:get/get.dart';
import '../../../shared/theme.dart';

class HomeArticleSection extends StatelessWidget {
  HomeArticleSection({Key? key}) : super(key: key);

  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 30,
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Artikel',
              style: AppText.textNormal.copyWith(
                fontWeight: AppText.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (newsController.status.value.isLoading)
              const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: AppColor.cBlack,
                ),
              ),
            if (newsController.status.value.isLoaded)
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: newsController.newsList.length,
                itemBuilder: (context, i) {
                  NewsModel news = newsController.newsList[i].value;
                  List pubDateArray = news.pubDate?.split(' ') ?? [];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ArticleTileWidget(
                      imageSrc: news.enclosure?.url ?? '-',
                      title: news.title ?? '-',
                      description:
                          parse(news.description).querySelector('p')?.text ??
                              '-',
                      pubDate:
                          '${pubDateArray[0]}, ${pubDateArray[1]} ${pubDateArray[2]} ${pubDateArray[3]}',
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
