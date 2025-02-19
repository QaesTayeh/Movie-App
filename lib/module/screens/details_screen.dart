part of '../../app_imoprts/app_imports.dart';

class DetailsScreen extends StatelessWidget {
  final int movieId;
  const DetailsScreen({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = context.read<MovieBloc>();

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
                                    //*--------------------------------------< Description >-----------------------------------
                                    //   const Gap(30),
                                    //   Row(
                                    //     crossAxisAlignment: CrossAxisAlignment.start,
                                    //     children: [
                                    //       const Gap(10),
                                    //       const Icon(
                                    //         FontAwesomeIcons.message,
                                    //         size: 22,
                                    //       ),
                                    //       const Gap(15),
                                    //       Container(
                                    //         constraints: BoxConstraints(
                                    //           maxWidth:
                                    //               MediaQuery.sizeOf(context).width *
                                    //               (80 / 100),
                                    //         ),
                                    //         child: TextViewCustom(
                                    //           maxLine: 7,
                                    //           text:
                                    //               jobsBloc
                                    //                   .jobsList[index]
                                    //                   .description ??
                                    //               '',
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    //   const Gap(10),
                                    //   //*---------------------------------------< Company >--------------------------------------
                                    //   Row(
                                    //     children: [
                                    //       const Gap(10),
                                    //       const Icon(
                                    //         FontAwesomeIcons.building,
                                    //         size: 22,
                                    //       ),
                                    //       const Gap(15),
                                    //       TextViewCustom(
                                    //         size: 14,
                                    //         maxLine: 2,
                                    //         text:
                                    //             jobsBloc.jobsList[index].company ?? '',
                                    //       ),
                                    //     ],
                                    //   ),
                                    //   const Gap(10),
                                    //   //*---------------------------------------< location >-------------------------------------
                                    //   Row(
                                    //     children: [
                                    //       const Gap(10),
                                    //       const Icon(
                                    //         FontAwesomeIcons.locationDot,
                                    //         size: 22,
                                    //       ),
                                    //       const Gap(15),
                                    //       TextViewCustom(
                                    //         maxLine: 2,
                                    //         text:
                                    //             jobsBloc.jobsList[index].location ?? '',
                                    //       ),
                                    //     ],
                                    //   ),
                                    //   const Gap(10),
                                    //   //*----------------------------------------< salary >--------------------------------------
                                    //   Row(
                                    //     children: [
                                    //       const Gap(10),
                                    //       const Icon(
                                    //         FontAwesomeIcons.dollarSign,
                                    //         size: 22,
                                    //       ),
                                    //       const Gap(15),
                                    //       TextViewCustom(
                                    //         color: AppColors.primary,
                                    //         size: 14,
                                    //         maxLine: 2,
                                    //         text: jobsBloc.jobsList[index].salary ?? '',
                                    //       ),
                                    //     ],
                                    //   ),
                                    //   const Gap(10),
                                    //   //*-----------------------------------------< Date >---------------------------------------
                                    //   Row(
                                    //     children: [
                                    //       const Gap(10),
                                    //       const Icon(
                                    //         FontAwesomeIcons.calendarDays,
                                    //         size: 22,
                                    //       ),
                                    //       const Gap(15),
                                    //       TextViewCustom(
                                    //         maxLine: 2,
                                    //         text:
                                    //             jobsBloc.jobsList[index].datePosted ??
                                    //             '',
                                    //       ),
                                    //     ],
                                    //   ),
                                    //   const Gap(10),
                                    //   //*------------------------------------< Long Description >--------------------------------
                                    //   Row(
                                    //     crossAxisAlignment: CrossAxisAlignment.start,
                                    //     children: [
                                    //       const Gap(10),
                                    //       const Icon(
                                    //         FontAwesomeIcons.rectangleList,
                                    //         size: 22,
                                    //       ),
                                    //       const Gap(15),
                                    //       Container(
                                    //         constraints: BoxConstraints(
                                    //           maxWidth:
                                    //               MediaQuery.sizeOf(context).width *
                                    //               (80 / 100),
                                    //         ),
                                    //         child: TextViewCustom(
                                    //           maxLine: 7,
                                    //           text:
                                    //               jobsBloc
                                    //                   .jobsList[index]
                                    //                   .longDescription ??
                                    //               '',
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    //   const Gap(10),
                                    //   //*--------------------------------------< Apply Button >----------------------------------
                                    //   const Gap(50),
                                    //   ButtonCustom(
                                    //     onPressed: () {},
                                    //     text: AppStrings.applyButton,
                                    //     height: 30,
                                    //     width: 150,
                                    //   ),
                                  ],
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
