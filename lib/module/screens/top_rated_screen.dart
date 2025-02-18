part of '../../app_imoprts/app_imports.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = context.read<MovieBloc>()
      ..add(LoadTopRatedListEvent());
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      return state is LoadingTopRatedListState
          ? Loader()
          : ListView.builder(
              shrinkWrap: true,
              itemCount: movieBloc.topRatedList.length,
              itemBuilder: (BuildContext context, int topRatedListIndex) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomCardWidget(
                        isFromMoviesList: false,
                        isFromTopRated: true,
                        id: movieBloc.topRatedList[topRatedListIndex].id,
                        popularity: movieBloc
                            .topRatedList[topRatedListIndex].popularity,
                        cardHeight: 720,
                        imageUrl:
                            '${AppStrings.baseImageUrl}${movieBloc.topRatedList[topRatedListIndex].posterPath}',
                        overview: movieBloc
                                .topRatedList[topRatedListIndex].overview ??
                            '',
                        releaseDate: movieBloc
                                .topRatedList[topRatedListIndex].releaseDate ??
                            '',
                        title:
                            movieBloc.topRatedList[topRatedListIndex].title ??
                                '',
                        voteAverage: movieBloc
                            .topRatedList[topRatedListIndex].voteAverage,
                        voteCount: movieBloc
                            .topRatedList[topRatedListIndex].voteCount
                            .toString()));
              });
    });
  }
}
