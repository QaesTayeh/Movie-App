part of '../../app_imoprts/app_imports.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = context.read<MovieBloc>();

    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return (state is LoadingMoviesListState || state is LoadingTVListState)
            ? Loader()
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * (1.2),
                    child: Column(
                      children: [
                        //!-----------------------------------------------< Movie Lable >------------------------------------------------
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: TextViewCustom(
                            text: 'Movies',
                            size: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //!-----------------------------------------------< Movie List >------------------------------------------------
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: movieBloc.moviesList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (
                              BuildContext context,
                              int moviesListIndex,
                            ) {
                              return CustomCardWidget(
                                listsType: ListsType.Movie,
                                onRatingUpdate: (rating) {
                                  movieBloc.add(
                                    SaveMovieRatingEvent(
                                      listType: ListsType.Movie,
                                      movieId:
                                          movieBloc
                                              .moviesList[moviesListIndex]
                                              .id,

                                      rating: rating,
                                    ),
                                  );
                                },
                                isFromTopRated: false,
                                id: movieBloc.moviesList[moviesListIndex].id,
                                popularity:
                                    movieBloc
                                        .moviesList[moviesListIndex]
                                        .popularity,
                                imageUrl:
                                    '${AppStrings.baseImageUrl}${movieBloc.moviesList[moviesListIndex].posterPath}',
                                overview:
                                    movieBloc
                                        .moviesList[moviesListIndex]
                                        .overview ??
                                    '',
                                releaseDate:
                                    movieBloc
                                        .moviesList[moviesListIndex]
                                        .releaseDate ??
                                    '',
                                title:
                                    movieBloc
                                        .moviesList[moviesListIndex]
                                        .title ??
                                    '',
                                voteAverage:
                                    movieBloc
                                        .moviesList[moviesListIndex]
                                        .voteAverage,
                                voteCount:
                                    movieBloc
                                        .moviesList[moviesListIndex]
                                        .voteCount
                                        .toString(),
                                isFromMoviesList: true,
                              );
                            },
                          ),
                        ),
                        //!------------------------------------------------< TV Lable >------------------------------------------------
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: TextViewCustom(
                            text: 'TV',
                            size: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //!------------------------------------------------< TV List >-------------------------------------------------
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: movieBloc.tvList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (
                              BuildContext context,
                              int tvListIndex,
                            ) {
                              return CustomCardWidget(
                                listsType: ListsType.TV,
                                onRatingUpdate: (rating) {
                                  movieBloc.add(
                                    SaveMovieRatingEvent(
                                      listType: ListsType.TV,
                                      movieId: movieBloc.tvList[tvListIndex].id,

                                      rating: rating,
                                    ),
                                  );
                                },
                                isFromTopRated: false,
                                id: movieBloc.tvList[tvListIndex].id,
                                popularity:
                                    movieBloc.tvList[tvListIndex].popularity,
                                imageUrl:
                                    '${AppStrings.baseImageUrl}${movieBloc.tvList[tvListIndex].posterPath}',
                                overview:
                                    movieBloc.tvList[tvListIndex].overview ??
                                    '',
                                releaseDate:
                                    movieBloc
                                        .tvList[tvListIndex]
                                        .firstAirDate ??
                                    '',
                                title: movieBloc.tvList[tvListIndex].name ?? '',
                                voteAverage:
                                    movieBloc.tvList[tvListIndex].voteAverage,
                                voteCount:
                                    movieBloc.tvList[tvListIndex].voteCount
                                        .toString(),
                                isFromMoviesList: false,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
      },
    );
  }
}
