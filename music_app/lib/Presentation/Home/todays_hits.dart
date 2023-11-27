import 'package:flutter/material.dart';
import 'package:music_app/Resources/Managers/colors_manager.dart';
import 'package:music_app/Resources/Managers/values_manager.dart';

class TodaysHits extends StatefulWidget {
  const TodaysHits({super.key});

  @override
  State<TodaysHits> createState() => _TodaysHitsState();
}

class _TodaysHitsState extends State<TodaysHits> {
  @override
  Widget build(BuildContext context) {
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
        Container(
          height: height * 0.35,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: AppSize.s18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: AppSize.s10),
                          width: width * 0.3,
                          // height: height * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorManager.Golden,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: AppSize.s8),
                                child: Text(
                                  "Hit title",
                                  style: textTheme.displaySmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "Song Subtitle ",
                                style: textTheme.displaySmall,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
