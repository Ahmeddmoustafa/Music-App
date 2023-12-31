import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/MusicPlayer/music_player_cubit.dart';
import 'package:music_app/Cubit/Track/track_cubit.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PlayListCard extends StatefulWidget {
  final int index;
  const PlayListCard({super.key, required this.index});

  @override
  State<PlayListCard> createState() => _PlayListCardState();
}

class _PlayListCardState extends State<PlayListCard> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    final albums = context.read<TracksCubit>().albums;

    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<TracksCubit, TracksState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            bool sameSong = BlocProvider.of<MusicPlayerCubit>(context)
                .selectSong(albums[albums.length - 3 - widget.index],
                    albums.length - 3 - widget.index);
            Navigator.pushNamed(context, Routes.musicPlayerRoute,
                arguments: sameSong);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) =>
                        const Text("Server Failure"),
                    fit: BoxFit.cover,
                    imageUrl:
                        albums[albums.length - 3 - widget.index].albumImage,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.s4),
                child: Text(
                  albums[albums.length - 3 - widget.index].artistName,
                  style: textTheme.displaySmall,
                ),
              ),
              Text(
                albums[albums.length - 3 - widget.index].albumName,
                style: textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}
