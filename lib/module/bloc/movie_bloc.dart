// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/app_imoprts/app_imports.dart';
import 'package:movie_app/model/media_model.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/utils/constant/app_strings.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  int currentPageIndex = 0;
  final Box<MediaModel> favoritesBox;
  final List<Widget> dashboardScreens = [
    DiscoverScreen(),
    FavoriteScreen(),
    TopRatedScreen(),
  ];
  List<MovieModel> topRatedList = [];
  List<MovieModel> moviesList = [];
  List<MovieModel> tvList = [];
  List<MediaModel> favorites = [];

  final DiscoverRepository discoverRepository = DiscoverRepository();

  MovieBloc(this.favoritesBox) : super(DashboardInitial()) {
    on<ChangeBottomNavigationBarValuEvent>((event, emit) async {
      currentPageIndex = event.value;
      emit(BottomNavigationBarValuState());
    });

    on<LoadMoviesListEvent>((event, emit) async {
      emit(LoadingMoviesListState());
      moviesList = await discoverRepository.getMovies();
      emit(LoadedMoviesListState());
    });

    on<LoadTVListEvent>((event, emit) async {
      emit(LoadingTVListState());
      tvList = await discoverRepository.getTV();
      emit(LoadedTVListState());
    });

    on<LoadTopRatedListEvent>((event, emit) async {
      emit(LoadingTopRatedListState());
      topRatedList = await discoverRepository.getTopRated();
      emit(LoadedTopRatedListState());
    });

    on<AddToFavoriteEvent>((event, emit) {
      emit(LoadingFavoritesEvent());
      favoritesBox.put('movie_${event.movie.id}', event.movie);
      favorites = List<MediaModel>.from(favoritesBox.values);
      event.isFromMoviesList
          ? moviesList.remove(
            moviesList.where((e) => e.id == event.movie.id).first,
          )
          : event.isFromTopRated
          ? topRatedList.remove(
            topRatedList.where((e) => e.id == event.movie.id).first,
          )
          : tvList.remove(tvList.where((e) => e.id == event.movie.id).first);
      emit(LoadedFavoritesEvent());
    });

    on<RemoveFromFavoriteEvent>((event, emit) {
      emit(LoadingFavoritesEvent());
      favoritesBox.delete('movie_${event.movie.id}');
      favorites = List<MediaModel>.from(favoritesBox.values);
      switch (event.movie.source) {
        case AppStrings.movie:
          moviesList.add(MovieModel.fromMediaModel(event.movie));
          add(LoadMoviesListEvent());
          break;
        case AppStrings.topRated:
          topRatedList.add(MovieModel.fromMediaModel(event.movie));
          add(LoadTopRatedListEvent());
          break;
        case AppStrings.tV:
          tvList.add(MovieModel.fromMediaModel(event.movie));
          add(LoadTVListEvent());
          break;
      }
      emit(LoadedFavoritesEvent());
    });
  }
}
