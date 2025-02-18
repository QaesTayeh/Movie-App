part of '../../app_imoprts/app_imports.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = context.read<MovieBloc>()
      ..add(LoadMoviesListEvent())
      ..add(LoadTVListEvent());
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(shrinkWrap: true, children: [
            SizedBox(
                height: MediaQuery.sizeOf(context).height * (1.2),
                child: Column(children: [
//!-----------------------------------------------< Movie Lable >------------------------------------------------
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: TextViewCustom(
                          text: 'Movies',
                          size: 18,
                          fontWeight: FontWeight.w600)),
//!-----------------------------------------------< Movie List >------------------------------------------------
                  state is LoadingMoviesListState
                      ? Loader()
                      : Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: movieBloc.moviesList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (
                                BuildContext context,
                                int moviesListIndex,
                              ) {
                                return CustomCardWidget(
                                    isFromTopRated: false,
                                    id: movieBloc
                                        .moviesList[moviesListIndex].id,
                                    popularity: movieBloc
                                        .moviesList[moviesListIndex].popularity,
                                    imageUrl:
                                        '${AppStrings.baseImageUrl}${movieBloc.moviesList[moviesListIndex].posterPath}',
                                    overview: movieBloc
                                            .moviesList[moviesListIndex]
                                            .overview ??
                                        '',
                                    releaseDate: movieBloc
                                            .moviesList[moviesListIndex]
                                            .releaseDate ??
                                        '',
                                    title: movieBloc.moviesList[moviesListIndex]
                                            .title ??
                                        '',
                                    voteAverage: movieBloc
                                        .moviesList[moviesListIndex]
                                        .voteAverage,
                                    voteCount: movieBloc
                                        .moviesList[moviesListIndex].voteCount
                                        .toString(),
                                    isFromMoviesList: true);
                              })),
//!------------------------------------------------< TV Lable >------------------------------------------------
                  state is LoadingTVListState
                      ? Loader()
                      : SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: TextViewCustom(
                              text: 'TV',
                              size: 18,
                              fontWeight: FontWeight.w600)),
//!------------------------------------------------< TV List >-------------------------------------------------
                  state is LoadingTVListState
                      ? Loader()
                      : Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: movieBloc.tvList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (
                                BuildContext context,
                                int moviesListIndex,
                              ) {
                                return CustomCardWidget(
                                    isFromTopRated: false,
                                    id: movieBloc.tvList[moviesListIndex].id,
                                    popularity: movieBloc
                                        .tvList[moviesListIndex].popularity,
                                    imageUrl:
                                        '${AppStrings.baseImageUrl}${movieBloc.tvList[moviesListIndex].posterPath}',
                                    overview: movieBloc
                                            .tvList[moviesListIndex].overview ??
                                        '',
                                    releaseDate: movieBloc
                                            .tvList[moviesListIndex]
                                            .firstAirDate ??
                                        '',
                                    title: movieBloc
                                            .tvList[moviesListIndex].name ??
                                        '',
                                    voteAverage: movieBloc
                                        .tvList[moviesListIndex].voteAverage,
                                    voteCount: movieBloc
                                        .tvList[moviesListIndex].voteCount
                                        .toString(),
                                    isFromMoviesList: false);
                              }))
                ]))
          ]));
    });
  }
}
