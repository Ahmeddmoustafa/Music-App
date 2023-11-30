import 'package:hive/hive.dart';

part 'album_model.g.dart';

@HiveType(typeId: 1)
class Album {
  @HiveField(0)
  final String albumImage;
  @HiveField(1)
  final String albumName;
  @HiveField(2)
  final String artistName;

  Album({
    required this.albumImage,
    required this.albumName,
    required this.artistName,
  });
  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumImage: json["image"][2]["#text"],
        albumName: json["name"],
        artistName: json["artist"],
      );
}
