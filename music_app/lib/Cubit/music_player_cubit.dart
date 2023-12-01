import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Data/Models/album_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/Resources/Managers/assets_manager.dart';
part 'music_player_state.dart';

class MusicPlayerCubit extends Cubit<MusicPlayerState> {
  final AudioPlayer player = AudioPlayer();
  late Album song;
  late int songIndex = -1;
  late bool playing = false;
  late bool paused = false;
  MusicPlayerCubit() : super(MusicPlayerInitial(played: false, paused: false));

  bool selectSong(Album selectedSong, int index) {
    bool same = false;
    emit(MusicPlayerInitial(played: false, paused: false));
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
    emit(MusicPlayerInitial(played: true, paused: false));
    player.stop();
    emit(MusicPlayerSelected(played: false, paused: false));
  }

  void replaySong() async {
    emit(MusicPlayerInitial(played: true, paused: true));
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
    emit(MusicPlayerInitial(played: true, paused: false));
    player.pause();
    playing = false;
    paused = true;
    emit(MusicPlayerSelected(played: false, paused: true));
  }

  void resume() {
    emit(MusicPlayerInitial(played: false, paused: true));
    if (player.audioSource != null) {
      player.play();
      playing = true;

      emit(MusicPlayerSelected(played: true, paused: false));
    }
    emit(MusicPlayerSelected(played: true, paused: false));
  }

  Future<void> playSong(bool sameSong) async {
    try {
      emit(MusicPlayerInitial(played: false, paused: false));
      if (!sameSong) {
        await player.setAsset(AssetsManager.Song1);
      }
      player.play();
      // player.stop();
      emit(MusicPlayerSelected(played: true, paused: false));
    } on Exception {
      emit(MusicPlayerSelected(played: false, paused: true));
      // print("Error");
    }
  }
}
