import 'package:flutter/material.dart';
import 'package:music_app/Presentation/AppBars/Music_app_bar.dart';

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
          )),
    );
  }
}
