import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:music_app/Data/Models/album_model.dart';
import 'package:music_app/api_constant.dart';

class RemoteSongsImpl {
  static void getAllSongs() async {}
  void fetchtracks() async {
    try {
      final Response response = await Dio().get(
        "https://ws.audioscrobbler.com/2.0/?method=album.search&album=love&api_key=${ApiConstants.apiKey}&format=json",
      );
      // print(response.data);

      if (response.statusCode == 200) {
        final Box trackResponseBox = await Hive.openBox("Tracks-Response");
        trackResponseBox.add(response.data);
      }
    } catch (e) {
      // print("the error is ${e.toString()}");
    }
  }

  void loadAllTracks() async {
    // print("func called");
    // _fetchtracks();

    final Box trackResponseBox = await Hive.openBox("Tracks-Response");
    final responseData = await trackResponseBox.getAt(1);
    if (responseData != null) {
      // print(responseData["results"]["albummatches"]["album"]);
    } else {
      return;
    }
    final List albums = responseData["results"]["albummatches"]["album"];

    Map<String, dynamic> newMap = {};

    List<Album> albumModels = [];
    for (int i = 0; i < albums.length; i++) {
      albums[i].forEach((key, value) {
        // Convert the key to a String
        String newKey = key.toString();

        // Add the entry to the new map
        newMap[newKey] = value;
      });

      albumModels.add(
        Album.fromJson(newMap),
      );
    }
    // print('hive response ${albumModels.length}');
    // final trackBox = await Hive.openBox<Album>("Tracks");
    // trackBox.addAll(albumModels);
  }

  Future<List<Album>> getAllAlbums() async {
    // loadAllTracks();
    try {
      final trackBox = await Hive.openBox<Album>("Tracks");
      // for (int i = 49; i <= 100; i++) await trackBox.deleteAt(i);

      final List<Album> albums = trackBox.values.toList();

      // print('loaded tracks ${albums.length}');
      return albums;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

//