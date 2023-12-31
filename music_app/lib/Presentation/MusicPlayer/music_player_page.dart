import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/MusicPlayer/music_player_cubit.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class MusicPlayer extends StatefulWidget {
  final bool sameSong;
  const MusicPlayer({super.key, required this.sameSong});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  void initState() {
    super.initState();
    if (!widget.sameSong) {
      // print("not the  same song");
      context.read<MusicPlayerCubit>().playSong(false);
    } else {
      context.read<MusicPlayerCubit>().playSong(true);
    }

    // context.read<MusicPlayerCubit>().playSong(1);

    // if(context.read<MusicPlayerCubit>().playing == true){

    // }
  }

  // double _currposition = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // backgroundColor: ColorManager.DarkGrey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.Transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(top: AppSize.s20),
          child: Text("Now Playing"),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: AppSize.s20, left: AppSize.s10),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: ColorManager.LightSilver,
              size: AppSize.s14,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: height * 0.9,
          width: width * 0.9,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.black12, ColorManager.DarkGrey],
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.95,
            child: Container(
              margin: EdgeInsets.only(top: height * 0.05),
              child: BlocBuilder<MusicPlayerCubit, MusicPlayerState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // width: width * 0.6,
                        margin: const EdgeInsets.only(bottom: AppSize.s10),
                        height: height * 0.4,

                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl:
                              context.read<MusicPlayerCubit>().song.albumImage,
                          // placeholder: (context, string) =>
                          //     const CircularProgressIndicator(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context
                                      .read<MusicPlayerCubit>()
                                      .song
                                      .artistName,
                                  style: textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: AppSize.s4,
                                ),
                                Text(
                                  context
                                      .read<MusicPlayerCubit>()
                                      .song
                                      .albumName,
                                  style: textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.favorite_rounded,
                            color: ColorManager.Pink,
                          ),
                        ],
                      ),
                      StreamBuilder<PositionData>(
                          stream: BlocProvider.of<MusicPlayerCubit>(context)
                              .positionDataStream,
                          builder: (context, snapshot) {
                            final positiondata = snapshot.data;
                            return ProgressBar(
                              thumbGlowRadius: AppSize.s16,
                              progressBarColor: ColorManager.Pink,
                              thumbColor: ColorManager.Pink,
                              progress: positiondata?.position ?? Duration.zero,
                              total: positiondata?.duration ?? Duration.zero,
                              onSeek: BlocProvider.of<MusicPlayerCubit>(context)
                                  .seek,
                            );
                            // return Row(
                            //   children: [
                            //     Text(
                            //       "0:00",
                            //       style: textTheme.displaySmall,
                            //     ),
                            //     Flexible(
                            //       child: Slider(
                            //         activeColor: ColorManager.Pink,
                            //         min: 0,
                            //         max: 100,
                            //         value: _currposition,
                            //         onChanged: (value) {
                            //           BlocProvider.of<MusicPlayerCubit>(context)
                            //               .seek(Duration());
                            //           // setState(() {
                            //           //   _currposition = value;
                            //           // });
                            //         },
                            //       ),
                            //     ),
                            //     Text(
                            //       "4:26",
                            //       style: textTheme.displaySmall,
                            //     ),
                            //   ],
                            // );
                          }),
                      Container(
                        margin:
                            const EdgeInsets.symmetric(vertical: AppSize.s20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.repeat,
                              color: ColorManager.White,
                            ),
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
                            Icon(
                              Icons.shuffle,
                              color: ColorManager.White,
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
