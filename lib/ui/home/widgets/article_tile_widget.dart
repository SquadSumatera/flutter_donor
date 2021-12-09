import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../shared/theme.dart';

class ArticleTileWidget extends StatelessWidget {
  const ArticleTileWidget({
    Key? key,
    required this.imageSrc,
    required this.title,
    required this.description,
    required this.pubDate,
  }) : super(key: key);

  final String imageSrc;
  final String title;
  final String description;
  final String pubDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 90,
        maxWidth: 325,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: imageSrc,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: 80,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return const SizedBox(
                  width: 80,
                  height: 90,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColor.cBlack,
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  width: 80,
                  height: 90,
                  color: AppColor.cGrey,
                );
              },
            ),
          ),
          const SizedBox(width: 27),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.textMedium.copyWith(
                    fontWeight: AppText.semiBold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  style: AppText.textSmall.copyWith(
                    fontWeight: AppText.light,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: <Widget>[
                    Text(
                      'Berita COVID-19',
                      style: AppText.textSmall.copyWith(
                        color: AppColor.cRed,
                        fontWeight: AppText.semiBold,
                      ),
                    ),
                    const SizedBox(width: 13),
                    Text(
                      "·",
                      style: AppText.textSmall.copyWith(
                        color: AppColor.silverChalice,
                        fontWeight: AppText.bold,
                      ),
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Text(
                        pubDate,
                        style: AppText.textSmall.copyWith(
                          color: AppColor.silverChalice,
                          fontWeight: AppText.light,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
