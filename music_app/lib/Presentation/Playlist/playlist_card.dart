import 'package:flutter/material.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class PlayListCard extends StatefulWidget {
  const PlayListCard({super.key});

  @override
  State<PlayListCard> createState() => _PlayListCardState();
}

class _PlayListCardState extends State<PlayListCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: ColorManager.DarkGrey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s4),
            child: Text(
              "Playlist Title",
              style: textTheme.displaySmall,
            ),
          ),
          Text(
            "Playlist SubTitle",
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
