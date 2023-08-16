import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class LyricsListItemWidget extends StatelessWidget {
  final String title;
  final String status;
  final int numberLikes;
  final String? imageUrl;
  const LyricsListItemWidget({
    super.key,
    required this.title,
    required this.status,
    this.numberLikes = 0,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                child: imageUrl != null
                    ? const Image(
                        image: NetworkImage(
                            "https://kamerlyrics.net/assets/uploads/souffrance-d-amour-ben-decca.jpg"),
                      )
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: AppFonts.subTitleFontSize,
                        color: AppColors.textColor,
                        fontWeight: AppFonts.titleFontWeight,
                      ),
                    ),
                    Text(
                      status,
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${numberLikes}k"),
                    IconButton(
                      onPressed: () {}, //TODO : like
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
