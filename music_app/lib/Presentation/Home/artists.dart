import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/Track/track_cubit.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    final albums = context.read<TracksCubit>().albums;

    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.s20),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return BlocBuilder<TracksCubit, TracksState>(
            builder: (context, state) {
              return Container(
                margin: const EdgeInsets.only(bottom: AppSize.s10),
                // width: width * 0.8,
                height: height * 0.1,
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.playlistsRoute),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.White,
                            borderRadius: BorderRadius.circular(AppSize.s10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: albums[index + 8].albumImage,
                              // placeholder: (context, string) =>
                              //     const CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: AppSize.s20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                albums[index + 8].artistName,
                                style: textTheme.bodyLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                albums[index + 8].albumName,
                                style: textTheme.bodyLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Icon(
                        Icons.more_vert,
                        color: ColorManager.White,
                      ))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
