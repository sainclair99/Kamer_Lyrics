import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class ArtistListItemWidget extends StatelessWidget {
  final String title;
  final String status;
  final int numberLikes;
  final String? imageUrl;
  final Function()? onTap;
  const ArtistListItemWidget({
    super.key,
    required this.title,
    required this.status,
    this.numberLikes = 0,
    this.imageUrl,
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
                  child: imageUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: NetworkImage(imageUrl!),
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: GestureDetector(
                    onTap: (){}, //TODO : follow the artist
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Center(
                          child: Text(
                            'Suivre',
                            style: TextStyle(
                              fontSize: AppFonts.primaryFontSize,
                              fontWeight: AppFonts.titleFontWeight,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
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
