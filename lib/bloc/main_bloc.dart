import 'package:bloc/bloc.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final AbstractNewsRepository repository;
  List<Article> featuredArticles = [];
  List<Article> latestArticles = [];
  int page = 0;

  MainBloc(this.repository) : super(MainInitial()) {
    on<MainInitialing>((event, emit) async {
      featuredArticles = await repository.getFeaturedArticles();
      latestArticles = await repository.getLatestArticles();
      emit(MainLoaded());
    });
    on<MainChangePage>((event, emit) {
      page = event.page;
      emit(MainLoading());
      emit(MainLoaded());
    });
    on<MainMarkById>((event, emit) {
      List<Article> newArticles = [];
      for (var article in latestArticles) {
        if (article.id == event.id) {
          newArticles.add(article.copyWith(readed: true));
        } else {
          newArticles.add(article);
        }
      }
      latestArticles = newArticles;
      emit(MainLoading());
      emit(MainLoaded());
    });
    on<MainMarkAll>((event, emit) {
      List<Article> readedArticles = [];
      for (var article in latestArticles) {
        readedArticles.add(article.copyWith(readed: true));
      }
      latestArticles = readedArticles;
      emit(MainLoading());
      emit(MainLoaded());
    });
  }
}
