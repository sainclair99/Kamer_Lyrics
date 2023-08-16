import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:kamer_lyrics/shared/utils/app_colors.dart';

import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:kamer_lyrics/shared/utils/app_fonts.dart';

import '../../../shared/routes/routes.dart';

@RoutePage()
class LyricsPageScreen extends StatelessWidget {
  const LyricsPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 326,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 294,
                        child: const Image(
                          image: AssetImage(
                            'assets/images/dieu-donne-blanche-bailly.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 294,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0),
                            ],
                            stops: const [
                              0.2,
                              0.5,
                              1,
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 294,
                        child: Column(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).padding.top),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {}, //TODO SEARCH ACTION BUTTON
                                  iconSize: AppFonts.iconSize,
                                  color: AppColors.secondaryColor,
                                  icon: const Icon(Icons.search),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Titre du song',
                                        style: TextStyle(
                                          color: AppColors.secondaryColor,
                                          fontSize: AppFonts.cardFirstFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.router
                                              .push(const ArtistRoute());
                                        }, //TODO : Redirect to the artist page
                                        child: Text(
                                          'Nom de l\'artiste',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize:
                                                AppFonts.cardFirstFontSize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed:
                                          () {}, //TODO : Like ation button
                                      iconSize: AppFonts.iconSize,
                                      color: AppColors.secondaryColor,
                                      icon: const Icon(Icons.favorite_border),
                                    ),
                                    IconButton(
                                      onPressed:
                                          () {}, //TODO : Share action button
                                      iconSize: AppFonts.iconSize,
                                      color: AppColors.secondaryColor,
                                      icon: const Icon(Icons.share),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Année: 2017',
                                      style: TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontSize: AppFonts.titleFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 20,
                        bottom: 0,
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 16,
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () {}, //TODO : Open youtube player
                            child: Icon(
                              Icons.play_arrow_rounded,
                              size: 45,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Les paroles [Title]',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        'Titre du song',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Commentaires',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Commenter',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      suffixIcon: Icon(
                        Icons.emoji_emotions_outlined,
                        size: AppFonts.iconSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
