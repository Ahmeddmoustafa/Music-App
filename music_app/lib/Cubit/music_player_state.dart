part of 'music_player_cubit.dart';

@immutable
sealed class MusicPlayerState {
  final bool played;

  MusicPlayerState({required this.played});
}

final class MusicPlayerInitial extends MusicPlayerState {
  MusicPlayerInitial({required super.played});
}

final class MusicPlayerSelected extends MusicPlayerState {
  MusicPlayerSelected({required super.played});
}
