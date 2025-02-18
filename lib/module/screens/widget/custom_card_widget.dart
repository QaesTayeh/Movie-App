part of '../../../app_imoprts/app_imports.dart';

class CustomCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final String voteCount;
  final double? cardWidth;
  final double? cardHeight;
  final int id;
  final double popularity;
  final bool isFromMoviesList;
  final bool isFromTopRated;

  const CustomCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.voteCount,
    this.cardWidth,
    this.cardHeight,
    required this.id,
    required this.popularity,
    required this.isFromMoviesList,
    required this.isFromTopRated,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> ratingvalueNotifier = ValueNotifier(0);
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SizedBox(
                width: cardWidth ?? 200,
                height: cardHeight,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(0),
                      child: Stack(children: [
//!-----------------------------------------------< Movie Image >------------------------------------------------
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.network(imageUrl)),
//!----------------------------------------------< Favorite Icon >-----------------------------------------------
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                                onTap: () {
                                  context
                                      .read<MovieBloc>()
                                      .add(AddToFavoriteEvent(
                                          MediaModel(
                                              source: isFromMoviesList
                                                  ? AppStrings.movie
                                                  : isFromTopRated
                                                      ? AppStrings.topRated
                                                      : AppStrings.tV,
                                              backdropPath: imageUrl,
                                              firstAirDate: releaseDate,
                                              overview: overview,
                                              posterPath: imageUrl,
                                              releaseDate: releaseDate,
                                              title: title,
                                              id: id,
                                              name: title,
                                              popularity: popularity,
                                              voteAverage: voteAverage,
                                              voteCount: int.parse(voteCount)),
                                          isFromMoviesList,
                                          isFromTopRated));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.grey,
                                          content: Row(spacing: 5, children: [
                                            TextViewCustom(
                                                fontWeight: FontWeight.bold,
                                                size: 14,
                                                text: title,
                                                color: AppColors.primary),
                                            TextViewCustom(
                                                size: 14,
                                                text:
                                                    AppStrings.addedToFavorites)
                                          ])));
                                },
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: Icon(FontAwesomeIcons.heart,
                                        color: AppColors.primary, size: 18))))
                      ])),
                  SizedBox(width: 10),
//!-----------------------------------------------< Movie Title >------------------------------------------------
                  TextViewCustom(
                      maxLine: 2,
                      text: title,
                      size: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary),
//!----------------------------------------------< Movie overview >----------------------------------------------
                  Expanded(
                      child: Center(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextViewCustom(
                                  maxLine: 6,
                                  textHeight: 1.5,
                                  textAlign: TextAlign.center,
                                  text: overview == ''
                                      ? '-----------------------'
                                      : overview)))),
//!---------------------------------------------< Movie more info >----------------------------------------------
                  Container(
                      height: 55,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DashedCircularProgressBar.aspectRatio(
                                    aspectRatio: 1,
                                    valueNotifier: ratingvalueNotifier,
                                    progress: voteAverage,
                                    maxProgress: 10,
                                    corners: StrokeCap.butt,
                                    foregroundColor: AppColors.primary,
                                    foregroundStrokeWidth: 5,
                                    backgroundStrokeWidth: 5,
                                    animation: true,
                                    child: Center(
                                        child: ValueListenableBuilder(
                                            valueListenable:
                                                ratingvalueNotifier,
                                            builder: (_, double value, __) => Text(
                                                '${double.parse(value.toStringAsFixed(1))}/10',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 9))))),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 10,
                                    children: [
                                      Row(spacing: 10, children: [
                                        Icon(FontAwesomeIcons.calendarDays,
                                            size: 14, color: AppColors.primary),
                                        TextViewCustom(
                                            text: DateTime.parse(releaseDate)
                                                .year
                                                .toString())
                                      ]),
                                      Row(spacing: 10, children: [
                                        Icon(FontAwesomeIcons.users,
                                            size: 14, color: AppColors.primary),
                                        TextViewCustom(text: voteCount)
                                      ])
                                    ])
                              ])))
                ]))));
  }
}
