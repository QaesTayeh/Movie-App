part of '../../app_imoprts/app_imports.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = context.read<MovieBloc>();

    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return state is LoadingTopRatedListState
            ? Loader()
            : GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.38,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemCount: movieBloc.topRatedList.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = movieBloc.topRatedList[index];

                return CustomCardWidget(
                  listsType: ListsType.TopRated,
                  onRatingUpdate: (rating) {
                    movieBloc.add(
                      SaveMovieRatingEvent(
                        listType: ListsType.TopRated,
                        movieId: movie.id,
                        rating: rating,
                      ),
                    );
                  },
                  isFromMoviesList: false,
                  isFromTopRated: true,
                  id: movie.id,
                  popularity: movie.popularity,
                  imageUrl: '${AppStrings.baseImageUrl}${movie.posterPath}',
                  overview: movie.overview ?? '',
                  releaseDate: movie.releaseDate ?? '',
                  title: movie.title ?? '',
                  voteAverage: movie.voteAverage,
                  voteCount: movie.voteCount.toString(),
                );
              },
            );
      },
    );
  }
}
