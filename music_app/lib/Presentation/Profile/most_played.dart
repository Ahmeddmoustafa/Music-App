import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/track_cubit.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MostPlayed extends StatefulWidget {
  const MostPlayed({super.key});

  @override
  State<MostPlayed> createState() => _MostPlayedState();
}

class _MostPlayedState extends State<MostPlayed> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final albums = context.read<TracksCubit>().albums;

    return SizedBox(
      width: width * 0.8,
      // height: height * 0.1,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: AppSize.s10),
              // width: width * 0.8,
              height: height * 0.1,
              child: BlocBuilder<TracksCubit, TracksState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.White,
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(albums[index].albumImage),
                            ),
                          ),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: albums[index].albumImage,
                            placeholder: (context, string) =>
                                CircularProgressIndicator(),
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
                                albums[index].artistName,
                                style: textTheme.bodyLarge,
                              ),
                              Text(
                                albums[index].albumName,
                                style: textTheme.bodyLarge,
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
                  );
                },
              ),
            );
          }),
    );
  }
}
