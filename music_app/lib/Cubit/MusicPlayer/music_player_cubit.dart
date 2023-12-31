import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Data/Models/album_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/Resources/Managers/assets_manager.dart';
import 'package:rxdart/rxdart.dart';

part 'music_player_state.dart';

class MusicPlayerCubit extends Cubit<MusicPlayerState> {
  final AudioPlayer player = AudioPlayer();
  late Album song;
  late int songIndex = -2;
  late bool playing = false;
  late bool paused = false;
  MusicPlayerCubit() : super(MusicPlayerInitial(played: false, paused: false));

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position: position,
          bufferedPosition: bufferedPosition,
          duration: duration ?? Duration.zero,
        ),
      );
  void seek(Duration position) async {
    await player.seek(position);
  }

  bool selectSong(Album selectedSong, int index) {
    bool same = false;
    // emit(MusicPlayerInitial(played: false, paused: false));
    // print("curr index $songIndex and next index is $index");
    if (songIndex == index) {
      same = true;
    }
    song = selectedSong;
    songIndex = index;

    emit(MusicPlayerSelected(played: true, paused: false));

    return same;
  }

  void stopSong() {
    // emit(MusicPlayerInitial(played: true, paused: false));
    player.stop();
    emit(MusicPlayerSelected(played: false, paused: false));
  }

  void replaySong() async {
    // emit(MusicPlayerInitial(played: true, paused: true));
    if (player.audioSource != null) {
      player.stop();
      await player.setAsset(AssetsManager.Song1);
      player.play();
      playing = true;
      emit(MusicPlayerSelected(played: true, paused: false));
    }
    // emit(MusicPlayerSelected(played: true,paused: true));
  }

  void pauseSong() {
    // emit(MusicPlayerInitial(played: true, paused: false));
    player.pause();
    playing = false;
    paused = true;
    emit(MusicPlayerSelected(played: false, paused: true));
  }

  void resume() {
    if (player.audioSource == null) {
      return;
    }
    // emit(MusicPlayerInitial(played: false, paused: true));
    if (player.audioSource != null) {
      player.play();
      playing = true;

      // emit(MusicPlayerSelected(played: true, paused: false));
    }
    emit(MusicPlayerSelected(played: true, paused: false));
  }

  Future<void> playSong(bool sameSong) async {
    try {
      // emit(MusicPlayerInitial(played: false, paused: false));
      if (!sameSong) {
        await player.setAsset(AssetsManager.Song1);
        player.play();
      }

      player.play();
      emit(MusicPlayerSelected(played: true, paused: false));

      // player.stop();
    } on Exception {
      emit(MusicPlayerSelected(played: false, paused: true));
      // print("Error");
    }
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData({
    required this.position,
    required this.bufferedPosition,
    required this.duration,
  });
}
