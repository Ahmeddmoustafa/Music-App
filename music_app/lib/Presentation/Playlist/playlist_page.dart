import 'package:flutter/material.dart';
import 'package:music_app/Presentation/AppBars/music_app_bar.dart';
import 'package:music_app/Presentation/Playlist/playlist_card.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, height * 0.1),
        child: const MusicAppBar(
          action: Icon(Icons.add),
          title: Text("Playlists"),
          home: false,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: width * 0.9,
          height: height,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: AppSize.s20),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return PlayListCard(
                      index: index,
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
