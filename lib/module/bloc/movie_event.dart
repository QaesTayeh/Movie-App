part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

class ChangeBottomNavigationBarValuEvent extends MovieEvent {
  final int value;
  ChangeBottomNavigationBarValuEvent({required this.value});
}

class LoadFavorites extends MovieEvent {}

class LoadMoviesListEvent extends MovieEvent {}

class LoadTVListEvent extends MovieEvent {}

class LoadTopRatedListEvent extends MovieEvent {}

class AddToFavoriteEvent extends MovieEvent {
  final MediaModel movie;
  final bool isFromMoviesList;
  final bool isFromTopRated;

  AddToFavoriteEvent(this.movie, this.isFromMoviesList, this.isFromTopRated);
}

class RemoveFromFavoriteEvent extends MovieEvent {
  final MediaModel movie;

  RemoveFromFavoriteEvent(this.movie);
}
