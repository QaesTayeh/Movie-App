part of '../../app_imoprts/app_imports.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = context.read<MovieBloc>();
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return state is LoadingFavoritesEvent
            ? Loader()
            : movieBloc.favorites.isNotEmpty
                ? ListView.builder(
                    itemCount: movieBloc.favorites.length,
                    itemBuilder: (context, index) {
                      final ValueNotifier<double> ratingvalueNotifier =
                          ValueNotifier(0);
                      final movie = movieBloc.favorites[index];
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            Card(
                                elevation: 5,
                                child: SizedBox(
                                    height: 230,
                                    child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(spacing: 10, children: [
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                        height: 170,
                                                        '${AppStrings.baseImageUrl}${movie.posterPath}')),
                                                ButtonCustom(
                                                    height: 30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    text: 'unfavorite',
                                                    iconData: FontAwesomeIcons
                                                        .solidHeart,
                                                    iconColor: AppColors
                                                        .backgroundColor,
                                                    onPressed: () {
                                                      context.read<MovieBloc>().add(
                                                          RemoveFromFavoriteEvent(
                                                              movie));
                                                    })
                                              ]),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        spacing: 5,
                                                        children: [
                                                          TextViewCustom(
                                                              size: 15,
                                                              color: AppColors
                                                                  .primary,
                                                              maxLine: 2,
                                                              text: movie
                                                                      .title ??
                                                                  movie.name ??
                                                                  '',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                          Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      maxWidth:
                                                                          230),
                                                              child: TextViewCustom(
                                                                  maxLine: 6,
                                                                  textHeight:
                                                                      1.5,
                                                                  text: movie
                                                                          .overview ??
                                                                      ''))
                                                        ])),
                                                Expanded(
                                                    child: Container(
                                                        width: MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width *
                                                            (50 / 100),
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .backgroundColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                DashedCircularProgressBar.aspectRatio(
                                                                    aspectRatio:
                                                                        1,
                                                                    valueNotifier:
                                                                        ratingvalueNotifier,
                                                                    progress: movie
                                                                        .voteAverage,
                                                                    maxProgress:
                                                                        10,
                                                                    corners:
                                                                        StrokeCap
                                                                            .butt,
                                                                    foregroundColor:
                                                                        AppColors
                                                                            .primary,
                                                                    foregroundStrokeWidth:
                                                                        5,
                                                                    backgroundStrokeWidth:
                                                                        5,
                                                                    animation:
                                                                        true,
                                                                    child: Center(
                                                                        child: ValueListenableBuilder(
                                                                            valueListenable:
                                                                                ratingvalueNotifier,
                                                                            builder: (_, double value, __) =>
                                                                                Text('${double.parse(value.toStringAsFixed(1))}/10', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12))))),
                                                                Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    spacing: 10,
                                                                    children: [
                                                                      Row(
                                                                          spacing:
                                                                              10,
                                                                          children: [
                                                                            Icon(FontAwesomeIcons.calendarDays,
                                                                                size: 14,
                                                                                color: AppColors.primary),
                                                                            TextViewCustom(text: DateTime.parse(movie.releaseDate ?? movie.firstAirDate ?? '').year.toString())
                                                                          ]),
                                                                      Row(
                                                                          spacing:
                                                                              10,
                                                                          children: [
                                                                            Icon(FontAwesomeIcons.users,
                                                                                size: 14,
                                                                                color: AppColors.primary),
                                                                            TextViewCustom(text: movie.voteCount.toString())
                                                                          ])
                                                                    ])
                                                              ]),
                                                        )))
                                              ])
                                        ]))))
                          ]));
                    })
                : EmptyWidget(text: 'No favorites yet.');
      },
    );
  }
}
