// ignore_for_file: prefer_const_constructors_in_immutables

part of 'music_player_cubit.dart';

@immutable
sealed class MusicPlayerState {
  final bool played;
  final bool paused;

  MusicPlayerState({required this.paused, required this.played});
}

final class MusicPlayerInitial extends MusicPlayerState {
  MusicPlayerInitial({required super.played, required super.paused});
}

final class MusicPlayerSelected extends MusicPlayerState {
  MusicPlayerSelected({required super.played, required super.paused});
}
