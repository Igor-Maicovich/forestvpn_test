import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/utils/colors.dart';

class FeaturedNewsItem extends StatelessWidget {
  final Article article;
  final double size;
  const FeaturedNewsItem(
      {super.key, required this.article, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: article.imageUrl,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              article.title,
              style: TextStyle(
                  fontSize: 28 + (360 - size) * (-0.14),
                  color: AppColors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
