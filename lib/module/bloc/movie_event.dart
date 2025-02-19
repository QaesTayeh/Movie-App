part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

class ChangeBottomNavigationBarValuEvent extends MovieEvent {
  final int value;
  ChangeBottomNavigationBarValuEvent({required this.value});
}

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

class SaveMovieRatingEvent extends MovieEvent {
  final int movieId;
  final double rating;
  final ListsType listType;
  SaveMovieRatingEvent({
    required this.movieId,
    required this.rating,
    required this.listType,
  });
}

class LoadMovieDetailsEvent extends MovieEvent {
  final int movieID;
  LoadMovieDetailsEvent({required this.movieID});
}
