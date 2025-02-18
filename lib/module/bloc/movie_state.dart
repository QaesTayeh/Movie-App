part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class DashboardInitial extends MovieState {}

class LoadingFavoritesEvent extends MovieState {}

class LoadedFavoritesEvent extends MovieState {}

class LoadingMoviesListState extends MovieState {}

class LoadedMoviesListState extends MovieState {}

class LoadingTVListState extends MovieState {}

class LoadedTVListState extends MovieState {}

class BottomNavigationBarValuState extends MovieState {}

class LoadingTopRatedListState extends MovieState {}

class LoadedTopRatedListState extends MovieState {}
