import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/music_player_cubit.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    }
    context.read<MusicPlayerCubit>().playSong(true);

    // context.read<MusicPlayerCubit>().playSong(1);

    // if(context.read<MusicPlayerCubit>().playing == true){

    // }
  }

  double _currposition = 0;
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
            child: Container(
              margin: EdgeInsets.only(top: height * 0.1),
              child: BlocBuilder<MusicPlayerCubit, MusicPlayerState>(
                builder: (context, state) {
                  return Column(
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
                      Slider(
                        activeColor: ColorManager.Pink,
                        min: 0,
                        max: 100,
                        value: _currposition,
                        onChanged: (value) {
                          setState(() {
                            _currposition = value;
                          });
                        },
                      ),
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
