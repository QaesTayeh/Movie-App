part of '../../app_imoprts/app_imports.dart';

class DiscoverApi {
  Future<List<MovieModel>> getMovies() async {
    List<dynamic> data;
    Response response = await get(Uri.parse(
        AppStrings.baseApiUrl + AppStrings.movieUrl + AppStrings.apiKey));
    dynamic body = json.decode(response.body);
    List<MovieModel> moviesList = [];
    if (response.statusCode == STATUSCODE.Success.value) {
      data = body["results"] ?? [];
      for (int i = 0; i < data.length; i++) {
        moviesList.add(MovieModel.fromJson(data[i]));
      }
      return moviesList;
    } else {
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(SnackBar(
          content: Text(STATUSCODE.values[response.statusCode].uiName),
          duration: const Duration(seconds: 5)));
    }
    return [];
  }

  Future<List<MovieModel>> getTV() async {
    List<dynamic> data;
    Response response = await get(
      Uri.parse(AppStrings.baseApiUrl + AppStrings.tvUrl + AppStrings.apiKey),
    );
    dynamic body = json.decode(response.body);
    List<MovieModel> tvList = [];
    if (response.statusCode == STATUSCODE.Success.value) {
      data = body["results"] ?? [];
      for (int i = 0; i < data.length; i++) {
        tvList.add(MovieModel.fromJson(data[i]));
      }
      return tvList;
    } else {
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(SnackBar(
          content: Text(STATUSCODE.values[response.statusCode].uiName),
          duration: const Duration(seconds: 5)));
    }
    return [];
  }

  Future<List<MovieModel>> getTopRated() async {
    List<dynamic> data;
    Response response = await get(Uri.parse(
        AppStrings.baseApiUrl + AppStrings.topRatedUrl + AppStrings.apiKey));
    dynamic body = json.decode(response.body);
    List<MovieModel> topRatedList = [];
    if (response.statusCode == STATUSCODE.Success.value) {
      data = body["results"] ?? [];
      for (int i = 0; i < data.length; i++) {
        topRatedList.add(MovieModel.fromJson(data[i]));
      }
      return topRatedList;
    } else {
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(SnackBar(
          content: Text(STATUSCODE.values[response.statusCode].uiName),
          duration: const Duration(seconds: 5)));
    }
    return [];
  }
}
