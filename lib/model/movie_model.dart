import 'package:movie_app/model/media_model.dart';

class MovieModel {
  final int id;
  final String? backdropPath;
  final String? originalTitle;
  final String? originalName;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? firstAirDate;
  final String? title;
  final String? name;
  final double voteAverage;
  final int voteCount;
  final String? tagline;
  final String? status;
  final int? budget;
  final int? revenue;
  final int? runtime;
  final List<String>? genres;
  final List<String>? productionCompanies;
  final List<String>? productionCountries;
  final List<String>? spokenLanguages;

  MovieModel({
    required this.id,
    this.backdropPath,
    this.originalTitle,
    this.originalName,
    this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    this.firstAirDate,
    this.title,
    this.name,
    required this.voteAverage,
    required this.voteCount,
    this.tagline,
    this.status,
    this.budget,
    this.revenue,
    this.runtime,
    this.genres,
    this.productionCompanies,
    this.productionCountries,
    this.spokenLanguages,
  });

  factory MovieModel.fromMediaModel(MediaModel media) {
    return MovieModel(
      id: media.id,
      title: media.title ?? media.name ?? 'Untitled',
      posterPath: media.posterPath ?? '',
      popularity: media.popularity,
      voteAverage: media.voteAverage,
      voteCount: media.voteCount,
    );
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      backdropPath: json['backdrop_path'],
      originalTitle: json['original_title'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      firstAirDate: json['first_air_date'],
      title: json['title'],
      name: json['name'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      tagline: json['tagline'],
      status: json['status'],
      budget: json['budget'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      genres:
          (json['genres'] as List?)?.map((g) => g['name'] as String).toList(),
      productionCompanies:
          (json['production_companies'] as List?)
              ?.map((p) => p['name'] as String)
              .toList(),
      productionCountries:
          (json['production_countries'] as List?)
              ?.map((p) => p['name'] as String)
              .toList(),
      spokenLanguages:
          (json['spoken_languages'] as List?)
              ?.map((s) => s['english_name'] as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'backdrop_path': backdropPath,
      'original_title': originalTitle,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'first_air_date': firstAirDate,
      'title': title,
      'name': name,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'tagline': tagline,
      'status': status,
      'budget': budget,
      'revenue': revenue,
      'runtime': runtime,
      'genres': genres,
      'production_companies': productionCompanies,
      'production_countries': productionCountries,
      'spoken_languages': spokenLanguages,
    };
  }
}
