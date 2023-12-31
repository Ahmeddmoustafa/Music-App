import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/MusicPlayer/music_player_cubit.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BottomMusicBar extends StatefulWidget {
  const BottomMusicBar({super.key});

  @override
  State<BottomMusicBar> createState() => _BottomMusicBarState();
}

class _BottomMusicBarState extends State<BottomMusicBar> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return BlocBuilder<MusicPlayerCubit, MusicPlayerState>(
      builder: (context, state) {
        return BottomAppBar(
          padding: EdgeInsets.all(0),
          height: height * 0.1,
          color: ColorManager.Transparent,
          child: GestureDetector(
            onTap: () {
              if (context.read<MusicPlayerCubit>().player.audioSource != null) {
                Navigator.pushNamed(context, Routes.musicPlayerRoute,
                    arguments: true);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: ColorManager.DarkGrey,
                    width: 0.3,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: (state.played == false && state.paused == false)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.music_note_outlined,
                                  size: 40,
                                  color: ColorManager.LightGrey,
                                ),
                              ],
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: ColorManager.DarkGrey,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                                child: CachedNetworkImage(
                                  imageUrl: context
                                      .read<MusicPlayerCubit>()
                                      .song
                                      .albumImage,
                                ),
                              ),
                            )),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.only(left: AppSize.s10),
                      // color: ColorManager.LightGrey,
                      child: (state.played == false && state.paused == false)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Song Title ",
                                  style: textTheme.displayLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Artist",
                                  style: textTheme.displayLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context
                                      .read<MusicPlayerCubit>()
                                      .song
                                      .artistName,
                                  style: textTheme.displayLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  context
                                      .read<MusicPlayerCubit>()
                                      .song
                                      .albumName,
                                  style: textTheme.displaySmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            BlocProvider.of<MusicPlayerCubit>(context)
                                .replaySong();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: ColorManager.White,
                          ),
                        ),
                        InkWell(
                          highlightColor: ColorManager.Transparent,
                          splashColor: ColorManager.Transparent,
                          onTap: () async {
                            state.played == false
                                ? BlocProvider.of<MusicPlayerCubit>(context)
                                    .resume()
                                : BlocProvider.of<MusicPlayerCubit>(context)
                                    .pauseSong();
                          },
                          child: Container(
                            height: AppSize.s50,
                            width: AppSize.s50,
                            decoration: BoxDecoration(
                                color: ColorManager.Pink,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                state.played == false
                                    ? Icons.play_arrow
                                    : Icons.pause,
                                color: ColorManager.White,
                                size: AppSize.s30,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: ColorManager.White,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
