import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/music_player_cubit.dart';
import 'package:music_app/Cubit/track_cubit.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TodayHits extends StatefulWidget {
  const TodayHits({super.key});

  @override
  State<TodayHits> createState() => _TodayHitsState();
}

class _TodayHitsState extends State<TodayHits> {
  @override
  Widget build(BuildContext context) {
    final albums = context.read<TracksCubit>().albums;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Today's Hits",
              style: textTheme.displayLarge,
            ),
          ],
        ),
        BlocBuilder<TracksCubit, TracksState>(
          builder: (context, state) {
            if (state is TracksLoaded) {
              return SizedBox(
                height: height * 0.25,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<MusicPlayerCubit>(context)
                              .selectSong(albums[index]);
                          Navigator.pushNamed(context, Routes.musicPlayerRoute);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: AppSize.s18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(top: AppSize.s10),
                                  width: width * 0.3,
                                  // height: height * 0.3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorManager.White,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s10),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              imageUrl:
                                                  albums[index].albumImage,
                                              placeholder: (context, string) =>
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: AppSize.s8),
                                        child: Text(
                                          albums[index].albumName,
                                          style: textTheme.displaySmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        albums[index].artistName,
                                        style: textTheme.displaySmall,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
