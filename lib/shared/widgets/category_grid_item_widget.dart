import 'package:flutter/material.dart';

import '../../05_genres/data/genre_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class CategoryGridItemWidget extends StatelessWidget {
  final GenreModel genre;
  const CategoryGridItemWidget({
    super.key,
    required this.genre,
  });

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
                  // image: DecorationImage(
                  //   image: NetworkImage(genre.image ??
                  //       'https://images.unsplash.com/photo-1643370857818-d3705b0a1ec1'),
                  // ),
                  borderRadius: BorderRadius.circular(10),
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Colors.green,
                  //     Colors.red,
                  //     Colors.yellow,
                  //     Colors.green.shade200,
                  //   ],
                  //   stops: const [
                  //     0.2,
                  //     0.6,
                  //     0.9,
                  //     1,
                  //   ],
                  // ),
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
                      Colors.black.withOpacity(0.1),
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
                  genre.label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: AppFonts.cardSecondFontSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
