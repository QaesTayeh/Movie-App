part of '../../app_imoprts/app_imports.dart';

class DiscoverRepository {
  final DiscoverApi discoverApi = DiscoverApi();
  Future<List<MovieModel>> getMovies() async {
    List<MovieModel> result = await discoverApi.getMovies();
    return result;
  }

  Future<List<MovieModel>> getTV() async {
    List<MovieModel> result = await discoverApi.getTV();
    return result;
  }

  Future<List<MovieModel>> getTopRated() async {
    List<MovieModel> result = await discoverApi.getTopRated();
    return result;
  }

  Future<MovieModel?> getMovieDetails(int movieId) async {
    MovieModel? result = await discoverApi.getMovieDetails(movieId);
    return result;
  }

  // Future<String> getGuestSessionId() async {
  //   String result = await discoverApi.getGuestSessionId();
  //   return result;
  // }

  // Future<bool> rateMedia(
  //   String mediaType,
  //   int mediaId,
  //   double rating,
  //   String guestSessionId,
  // ) async {
  //   bool result = await discoverApi.rateMedia(
  //     mediaType,
  //     mediaId,
  //     rating,
  //     guestSessionId,
  //   );
  //   return result;
  // }
}
