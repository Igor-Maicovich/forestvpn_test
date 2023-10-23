import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/bloc/main_bloc.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/ui/screens/article_screen.dart';
import 'package:forestvpn_test/utils/colors.dart';
import 'package:forestvpn_test/utils/extensions.dart';

class LastNewsItem extends StatelessWidget {
  final Article article;
  const LastNewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: article.readed ? AppColors.gray : AppColors.white,
          borderRadius: BorderRadius.circular(9),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: article.imageUrl,
                height: 60,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    article.title,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    article.publicationDate.toDaysAgo(),
                    maxLines: 2,
                    style: TextStyle(fontSize: 12, color: AppColors.secondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        context.read<MainBloc>().add(MainMarkById(article.id));
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ArticleScreen(article: article),
          ),
        );
      },
    );
  }
}
