import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/bloc/main_bloc.dart';
import 'package:forestvpn_test/ui/components/featured_news_block.dart';
import 'package:forestvpn_test/ui/components/last_news_item.dart';
import 'package:forestvpn_test/utils/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: AppColors.basicText, fontSize: 18),
        ),
        backgroundColor: AppColors.gray,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              context.read<MainBloc>().add(MainMarkAll());
            },
            child: Text(
              'Mark all read',
              style: TextStyle(color: AppColors.basicText, fontSize: 18),
            ),
          ),
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainInitial) {
            context.read<MainBloc>().add(MainInitialing());
          }
          if (state is MainLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 360,
                    collapsedHeight: 120,
                    backgroundColor: AppColors.gray,
                    stretch: true,
                    flexibleSpace: LayoutBuilder(
                      builder: (context, constraints) {
                        return constraints.biggest.height > 130
                            ? FeaturedNewsBloc(
                                articles:
                                    context.read<MainBloc>().featuredArticles,
                                size: constraints.biggest.height,
                              )
                            : LastNewsItem(
                                article:
                                    context.read<MainBloc>().featuredArticles[
                                        context.read<MainBloc>().page],
                              );
                      },
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, int index) {
                        return index == 0
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Latest News',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            : LastNewsItem(
                                article: context
                                    .read<MainBloc>()
                                    .latestArticles[index - 1]);
                      },
                      childCount:
                          context.read<MainBloc>().latestArticles.length + 1,
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
