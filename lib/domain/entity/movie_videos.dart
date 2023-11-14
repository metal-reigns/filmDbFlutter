import 'package:json_annotation/json_annotation.dart';

part 'movie_videos.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieVideos {
  final List<VideoResult> results;

  MovieVideos({
    required this.results,
  });

  factory MovieVideos.fromJson(Map<String, dynamic> json) =>
      _$MovieVideosFromJson(json);
  Map<String, dynamic> toJson() => _$MovieVideosToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class VideoResult {
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final DateTime publishedAt;
  final String id;

  VideoResult({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory VideoResult.fromJson(Map<String, dynamic> json) =>
      _$VideoResultFromJson(json);
  Map<String, dynamic> toJson() => _$VideoResultToJson(this);
}
