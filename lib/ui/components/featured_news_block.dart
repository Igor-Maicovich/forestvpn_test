import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/bloc/main_bloc.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/ui/components/featured_News_item.dart';

class FeaturedNewsBloc extends StatelessWidget {
  final List<Article> articles;
  final double size;
  const FeaturedNewsBloc(
      {super.key, required this.articles, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Featured News',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              onPageChanged: (value) {
                context.read<MainBloc>().add(MainChangePage(value));
              },
              itemBuilder: (_, index) => FeaturedNewsItem(
                article: articles[index],
                size: size,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
