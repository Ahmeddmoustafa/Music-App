import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Data/Models/album_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/Resources/Managers/assets_manager.dart';
part 'music_player_state.dart';

class MusicPlayerCubit extends Cubit<MusicPlayerState> {
  final AudioPlayer player = AudioPlayer();
  late Album song;
  MusicPlayerCubit() : super(MusicPlayerInitial(played: false));

  void selectSong(Album selectedSong) {
    emit(MusicPlayerInitial(played: false));
    song = selectedSong;
    emit(MusicPlayerSelected(played: false));
  }

  void stopSong() {
    emit(MusicPlayerInitial(played: true));
    player.stop();
    emit(MusicPlayerSelected(played: false));
  }

  void playSong(song) async {
    try {
      emit(MusicPlayerInitial(played: false));
      await player.setAsset(AssetsManager.Song1);
      player.play();
      // player.stop();
      emit(MusicPlayerSelected(played: true));
    } on Exception {
      emit(MusicPlayerSelected(played: false));
      print("Error");
    }
  }
}
