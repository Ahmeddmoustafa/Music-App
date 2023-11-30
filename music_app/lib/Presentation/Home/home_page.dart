import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Cubit/music_player_cubit.dart';
import 'package:music_app/Cubit/track_cubit.dart';
import 'package:music_app/Data/Models/album_model.dart';
import 'package:music_app/Presentation/AppBars/music_app_bar.dart';
import 'package:music_app/Presentation/Home/artists.dart';
import 'package:music_app/Presentation/Home/todays_hits.dart';
import 'package:music_app/Resources/Managers/assets_manager.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/routes_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  void initState() {
    super.initState();
    // RemoteSongsImpl.loadAllTracks();
    // BlocProvider.of<TracksCubit>(context).LoadTracks();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, height * 0.1),
        child: const MusicAppBar(
          action: Icon(
            Icons.settings,
          ),
          title: Text("LOGO"),
          home: true,
        ),
      ),
      body: FutureBuilder(
          future: BlocProvider.of<TracksCubit>(context).loadTracks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: AppSize.s10),
                    width: width * 0.9,
                    color: ColorManager.Black,
                    child: Column(
                      children: [
                        const TodayHits(),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.musicPlayerRoute);

                            BlocProvider.of<MusicPlayerCubit>(context)
                                .selectSong(Album(
                                    albumImage:
                                        "https://mir-s3-cdn-cf.behance.net/projects/404/57f6c7176428221.64c977e00a326.jpg",
                                    albumName: "Ana Negm",
                                    artistName: "Amir Eid"));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: AppSize.s10),
                            height: height * 0.25,
                            decoration: BoxDecoration(
                              color: ColorManager.Pink,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Stack(
                              // alignment: Alignment.centerLeft,
                              children: [
                                FractionallySizedBox(
                                  widthFactor: 0.5,
                                  heightFactor: 0.8,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: AppSize.s8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Popular Today",
                                            style: textTheme.displayLarge),
                                        Text(
                                            "Enjoy Exculsive songs ,  listen to AMIR EID",
                                            style: textTheme.bodySmall),
                                      ],
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  // bottom: -height * .03,
                                  // right: 0,
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Image(
                                          image: AssetImage(
                                              AssetsManager.ArtistImage))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              "Artists",
                              style: textTheme.displayLarge,
                            ),
                          ],
                        ),
                        const Artists(),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}


// Image.network(
//                               "https://gcdnb.pbrd.co/images/Vqezxpi4jKMl.png?o=1",
//                               width: width * .5,
//                               height: height * .4,
//                             ),