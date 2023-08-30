import 'package:flutter/material.dart';
import 'package:kamer_lyrics/shared/utils/app_fonts.dart';

import '../../02_lyrics/data/models/lyrics_model.dart';

class LyricsSliderItemWidget extends StatelessWidget {
  final String artistName;
  final String imagePath;
  final LyricsModel lyrics;
  const LyricsSliderItemWidget({
    super.key,
    required this.artistName,
    this.imagePath = 'assets/images/dieu-donne-blanche-bailly.jpg',
    required this.lyrics,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 2,
                      color: Color(0xc0c0c0c0)),
                ],
              ),
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage(
                          lyrics.image ?? imagePath,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.3),
                        ],
                        stops: const [
                          0.2,
                          0.7,
                          1,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                lyrics.title,
                style: TextStyle(
                  fontSize: AppFonts.cardFirstFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                artistName,
                style: TextStyle(
                  fontSize: AppFonts.cardSecondFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
