part of '../../app_imoprts/app_imports.dart';

class DetailsScreen extends StatelessWidget {
  final int movieId;
  const DetailsScreen({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = context.read<MovieBloc>();
    final ValueNotifier<double> ratingvalueNotifier = ValueNotifier(0);

    return BlocProvider.value(
      value: movieBloc..add(LoadMovieDetailsEvent(movieID: movieId)),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body:
                  state is LoadingMovieDetailsListState
                      ? Loader()
                      : SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            //!----------------------------------------< Header >---------------------------------------
                            //*----------------------------------------< Image >---------------------------------------
                            SizedBox(
                              width: double.infinity,
                              child: ImageNetwork(
                                image:
                                    '${AppStrings.baseImageUrl}${movieBloc.movieDetails?.backdropPath}',

                                height: 305,
                                width: double.infinity,
                              ),
                            ),
                            //*-------------------------------------< Back Button >------------------------------------
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      color: AppColors.secondary.withValues(
                                        alpha: .5,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          size: 18,
                                          color: AppColors.primary,
                                          Icons.arrow_back,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //!----------------------------------------< Body >---------------------------------------
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  color: Colors.white,
                                ),
                                height:
                                    MediaQuery.sizeOf(context).height *
                                    (65 / 100),
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: Center(
                                          child: TextViewCustom(
                                            maxLine: 3,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w600,
                                            size: 18,
                                            text:
                                                movieBloc.movieDetails?.title ??
                                                '',
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      ListTile(
                                        leading: const Icon(
                                          FontAwesomeIcons.film,
                                          size: 22,
                                        ),
                                        title: TextViewCustom(
                                          size: 14,
                                          maxLine: 3,
                                          text:
                                              '${movieBloc.movieDetails?.genres}'
                                                  .toString()
                                                  .replaceAll("[", "")
                                                  .replaceAll("]", ""),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ListTile(
                                              leading: const Icon(
                                                FontAwesomeIcons.users,
                                                size: 22,
                                              ),
                                              title: TextViewCustom(
                                                size: 14,
                                                maxLine: 2,
                                                text:
                                                    '${movieBloc.movieDetails?.popularity}',
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTile(
                                              leading: const Icon(
                                                FontAwesomeIcons.calendarDays,
                                                size: 22,
                                              ),
                                              title: TextViewCustom(
                                                size: 14,
                                                maxLine: 2,
                                                text:
                                                    '${movieBloc.movieDetails?.releaseDate}',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          FontAwesomeIcons.building,
                                          size: 22,
                                        ),
                                        title: TextViewCustom(
                                          size: 14,
                                          maxLine: 2,
                                          text:
                                              '${movieBloc.movieDetails?.productionCompanies}'
                                                  .toString()
                                                  .replaceAll("[", "")
                                                  .replaceAll("]", ""),
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          FontAwesomeIcons.discourse,
                                          size: 22,
                                        ),
                                        title: TextViewCustom(
                                          size: 14,
                                          maxLine: 20,
                                          text:
                                              '${movieBloc.movieDetails?.overview}',
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          FontAwesomeIcons.earthAmericas,
                                          size: 22,
                                        ),
                                        title: TextViewCustom(
                                          size: 14,
                                          maxLine: 20,
                                          text:
                                              '${movieBloc.movieDetails?.productionCountries}'
                                                  .toString()
                                                  .replaceAll("[", "")
                                                  .replaceAll("]", ""),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: AppColors.primary,
                                            radius: 50,
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundColor: Colors.grey,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Icon(
                                                    size: 25,
                                                    FontAwesomeIcons
                                                        .arrowsDownToPeople,
                                                    color:
                                                        AppColors
                                                            .backgroundColor,
                                                  ),
                                                  TextViewCustom(
                                                    text:
                                                        movieBloc
                                                            .movieDetails
                                                            ?.voteCount
                                                            .toString(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            radius: 50,
                                            child: DashedCircularProgressBar.aspectRatio(
                                              aspectRatio: 1,
                                              valueNotifier:
                                                  ratingvalueNotifier,
                                              progress:
                                                  movieBloc
                                                      .movieDetails
                                                      ?.voteAverage ??
                                                  0,
                                              maxProgress: 10,
                                              corners: StrokeCap.butt,
                                              foregroundColor:
                                                  AppColors.primary,
                                              foregroundStrokeWidth: 10,
                                              backgroundStrokeWidth: 10,
                                              animation: true,
                                              child: Center(
                                                child: ValueListenableBuilder(
                                                  valueListenable:
                                                      ratingvalueNotifier,
                                                  builder:
                                                      (
                                                        _,
                                                        double value,
                                                        __,
                                                      ) => Text(
                                                        '${double.parse(value.toStringAsFixed(1))}/10',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
            ),
          );
        },
      ),
    );
  }
}
