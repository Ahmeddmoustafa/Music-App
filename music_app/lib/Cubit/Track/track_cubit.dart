import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Data/Models/album_model.dart';
import 'package:music_app/Data/Remote/remote_data_source.dart';

part 'track_state.dart';

class TracksCubit extends Cubit<TracksState> {
  final dataSource = RemoteSongsImpl();
  late List<Album> albums = [];
  TracksCubit() : super(TracksInitial());
  Future<void> loadTracks() async {
    emit(TracksLoading());
    try {
      albums = await dataSource.getAllAlbums();
      emit(TracksLoaded());
    } on Exception {
      emit(TracksFailed());
    }
  }
}
