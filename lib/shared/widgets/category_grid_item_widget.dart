import 'package:flutter/material.dart';
import 'package:kamer_lyrics/shared/utils/app_colors.dart';
import 'package:kamer_lyrics/shared/utils/app_fonts.dart';

class CategoryGridItemWidget extends StatelessWidget {
  const CategoryGridItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width * 0.4;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        child: InkWell(
          //! Incorrect use of ParentDataWidget
          onTap: () {}, // TODO: Join Category details page
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: cardWidth,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: cardWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.0),
                    ],
                    stops: const [
                      0.2,
                      1,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  'Genre Lyrics Lyrics',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: AppFonts.cardSecondFontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
