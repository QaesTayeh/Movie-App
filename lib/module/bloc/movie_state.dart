part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class DashboardInitial extends MovieState {}

class LoadingFavoritesState extends MovieState {}

class LoadedFavoritesState extends MovieState {}

class LoadedGuestSessionIdState extends MovieState {}

class LoadingMoviesListState extends MovieState {}

class LoadedMoviesListState extends MovieState {}

class LoadingTVListState extends MovieState {}

class LoadedTVListState extends MovieState {}

class BottomNavigationBarValuState extends MovieState {}

class LoadingTopRatedListState extends MovieState {}

class LoadedTopRatedListState extends MovieState {}

class LoadingMovieDetailsListState extends MovieState {}

class LoadedMovieDetailsListState extends MovieState {}
