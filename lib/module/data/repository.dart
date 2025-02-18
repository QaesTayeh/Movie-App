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
}
