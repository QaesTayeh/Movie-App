part of '../../app_imoprts/app_imports.dart';

class DiscoverApi {
  Future<List<MovieModel>> getMovies() async {
    List<dynamic> data;
    Response response = await get(
      Uri.parse(
        AppStrings.baseApiUrl + AppStrings.movieUrl + AppStrings.apiKey,
      ),
    );
    dynamic body = json.decode(response.body);
    List<MovieModel> moviesList = [];
    if (response.statusCode == STATUSCODE.Success.value) {
      data = body["results"] ?? [];
      for (int i = 0; i < data.length; i++) {
        moviesList.add(MovieModel.fromJson(data[i]));
      }
      return moviesList;
    } else {
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(STATUSCODE.values[response.statusCode].uiName),
          duration: const Duration(seconds: 5),
        ),
      );
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
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(STATUSCODE.values[response.statusCode].uiName),
          duration: const Duration(seconds: 5),
        ),
      );
    }
    return [];
  }

  Future<List<MovieModel>> getTopRated() async {
    List<dynamic> data;
    Response response = await get(
      Uri.parse(
        AppStrings.baseApiUrl + AppStrings.topRatedUrl + AppStrings.apiKey,
      ),
    );
    dynamic body = json.decode(response.body);
    List<MovieModel> topRatedList = [];
    if (response.statusCode == STATUSCODE.Success.value) {
      data = body["results"] ?? [];
      for (int i = 0; i < data.length; i++) {
        topRatedList.add(MovieModel.fromJson(data[i]));
      }
      return topRatedList;
    } else {
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(STATUSCODE.values[response.statusCode].uiName),
          duration: const Duration(seconds: 5),
        ),
      );
    }
    return [];
  }

  // Future<String> getGuestSessionId() async {
  //   Response response = await get(
  //     Uri.parse(
  //       AppStrings.baseApiUrl + AppStrings.guestSessionUrl + AppStrings.apiKey,
  //     ),
  //   );
  //   if (response.statusCode == STATUSCODE.Success.value) {
  //     final data = jsonDecode(response.body);
  //     String guestSessionId = data['guest_session_id'];
  //     return guestSessionId;
  //   } else {
  //     return '';
  //   }
  // }

  // Future<bool> rateMedia(
  //   String mediaType,
  //   int mediaId,
  //   double rating,
  //   String guestSessionId,
  // ) async {
  //   Response response = await post(
  //     Uri.parse(
  //       '${AppStrings.baseApiUrl}$mediaType/$mediaId/rating${AppStrings.apiKey}&guest_session_id=$guestSessionId',
  //     ),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({'value': rating}),
  //   );

  //   json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   }
  //   return true;
  // }

  Future<MovieModel?> getMovieDetails(int movieId) async {
    MovieModel? movieDetails;
    Map<String, dynamic> data;
    Response response = await get(
      Uri.parse(
        '${AppStrings.baseApiUrl}${AppStrings.movieDetailsUrl}$movieId${AppStrings.apiKey}',
      ),
    );

    if (response.statusCode == STATUSCODE.Success.value) {
      data = json.decode(response.body);

      movieDetails = MovieModel.fromJson(data);
      print(data);
      return movieDetails;
    } else {
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(STATUSCODE.values[response.statusCode].uiName),
          duration: const Duration(seconds: 5),
        ),
      );
    }
    return null;
  }
}
