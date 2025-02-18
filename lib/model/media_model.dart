import 'package:hive/hive.dart';

part 'media_model.g.dart';

@HiveType(typeId: 1)
class MediaModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? backdropPath;

  @HiveField(2)
  final String? originalTitle;

  @HiveField(3)
  final String? originalName;

  @HiveField(4)
  final String? overview;

  @HiveField(5)
  final double popularity;

  @HiveField(6)
  final String? posterPath;

  @HiveField(7)
  final String? releaseDate;

  @HiveField(8)
  final String? firstAirDate;

  @HiveField(9)
  final String? title;

  @HiveField(10)
  final String? name;

  @HiveField(11)
  final double voteAverage;

  @HiveField(12)
  final int voteCount;

  @HiveField(13)
  final String source;

  MediaModel({
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
    required this.source,
  });
}

