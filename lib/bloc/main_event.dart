part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

final class MainInitialing extends MainEvent {}

final class MainChangePage extends MainEvent {
  final int page;
  MainChangePage(this.page);
}

final class MainMarkById extends MainEvent {
  final String id;
  MainMarkById(this.id);
}

final class MainMarkAll extends MainEvent {}
