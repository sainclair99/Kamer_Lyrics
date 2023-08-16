import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:kamer_lyrics/shared/utils/app_colors.dart';
import 'package:kamer_lyrics/shared/widgets/glass_morphism.dart';

import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

import 'shared/widgets/lyrics_slider_item_widget.dart';

@RoutePage()
class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 513,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/dieu-donne-blanche-bailly.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                GlassMorphism(
                  sigmaX: 12,
                  sigmaY: 12,
                  child: SizedBox(
                    height: 513,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.001),
                      ],
                      stops: const [
                        0.4,
                        1,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 513,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(-4, 4),
                              blurRadius: 50.0,
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 75,
                          backgroundImage: AssetImage(
                              'assets/images/dieu-donne-blanche-bailly.jpg'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Nom de l\'artiste',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'XX Lyrics',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'XX Fans',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 137,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Suivre',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 377,
                        height: 86,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                width: 2,
                                color: Color.fromARGB(115, 122, 119, 119)),
                          ),
                        ),
                        child: const Text(
                          'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta, cupiditate. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta, cupiditate.',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SocialMediaButton.facebook(
                  onTap: () {},
                  size: 35,
                  color: Colors.black,
                ),
                SocialMediaButton.twitter(
                  onTap: () {},
                  size: 35,
                  color: Colors.black,
                ),
                SocialMediaButton.instagram(
                  onTap: () {},
                  size: 35,
                  color: Colors.black,
                ),
              ],
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[500],
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Song populaires',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 0.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const LyricsSliderItemWidget(
                    artistName: 'Nom de l\'artiste',
                    songTitle: 'Titre du song',
                    imagePath: 'assets/images/dieu-donne-blanche-bailly.jpg',
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: 3,
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Albums',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 208,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, right: 10),
                children: [
                  for (int i = 0; i <= 4; i++) ...[
                    const AlbumCardWidget(),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Tous les lyrics',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const DisplayRowLyricsWidget();
              },
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: 7,
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumCardWidget extends StatelessWidget {
  const AlbumCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/dieu-donne-blanche-bailly.jpg'),
            ),
          ),
          const Text(
            'Titre de l\'album',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Text(
            'Annee',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

class DisplayRowLyricsWidget extends StatelessWidget {
  const DisplayRowLyricsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(-4, -4),
              spreadRadius: 2.0,
              blurStyle: BlurStyle.normal,
              blurRadius: 5.0,
              color: Colors.black.withOpacity(0.02),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const Image(
                  image:
                      AssetImage('assets/images/dieu-donne-blanche-bailly.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              height: 80,
              padding: const EdgeInsets.only(top: 10),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Titre du song',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Nom de l\'artiste',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
