import 'package:flutter/material.dart';
import 'package:kamer_lyrics/02_lyrics/business_logic/cubit/lyrics_cubit.dart';
import 'package:kamer_lyrics/02_lyrics/data/models/lyrics_model.dart';
import 'package:kamer_lyrics/service_locator.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class LyricsListItemWidget extends StatelessWidget {
  final LyricsModel lyrics;
  final Function()? onTap;

  const LyricsListItemWidget({
    super.key,
    required this.lyrics,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 70,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0.5,
            // color: Colors.white54.withOpacity(0.85),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: lyrics.image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: NetworkImage(lyrics.image!),
                            fit: BoxFit.cover,
                          ),
                        )
                      : null,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lyrics.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppFonts.subTitleFontSize,
                            color: AppColors.textColor,
                            fontWeight: AppFonts.titleFontWeight,
                          ),
                        ),
                        Text(
                          lyrics.authors![0].name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppFonts.primaryFontSize,
                            color: AppColors.subTextColor,
                            fontWeight: AppFonts.titleFontWeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${lyrics.liskesCount}"),
                      IconButton(
                        onPressed: () {
                          getIt
                              .get<LyricsCubit>()
                              .likeLyrics(lyricsId: lyrics.id);
                        }, //TODO : like
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
