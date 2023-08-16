import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kamer_lyrics/shared/utils/app_colors.dart';
import 'package:kamer_lyrics/shared/utils/app_fonts.dart';
import 'package:kamer_lyrics/shared/widgets/category_grid_item_widget.dart';

import 'shared/widgets/article_card_widget.dart';
import 'shared/widgets/lyrics_list_item_widget.dart';
import 'shared/widgets/lyrics_slider_item_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var color = Colors.black;
  dynamic indexScroll = 0;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: w,
        height: h,
        child: ListView(
          children: [
            CarouselSlider.builder(
              carouselController: CarouselController(),
              itemCount: 4,
              itemBuilder: (context, index, realIndex) => InkWell(
                onTap: () {},
                child: const LyricsSliderItemWidget(
                  artistName: 'Nom de l\'artiste',
                  songTitle: 'Titre du song',
                  imagePath: 'assets/images/dieu-donne-blanche-bailly.jpg',
                ),
              ),
              options: CarouselOptions(
                enlargeFactor: 0.2,
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                onPageChanged: (index, reason) {
                  setState(() {
                    color = Colors.blueGrey;
                  });
                  setState(() {
                    indexScroll = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++) ...[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: indexScroll == i
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),
            const TitlePart(
              // * Category section--------------------------
              leading: 'Catégories',
              suffix: 'voir plus',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children: [
                  for (int i = 0; i < 6; i++) ...[
                    const CategoryGridItemWidget()
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),
            const TitlePart(
              // * Artist section--------------------------
              leading: 'Top artistes',
              suffix: 'voir plus',
            ),
            SizedBox(
              width: w,
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: 6,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 45,
                      ),
                      Text(
                        'l\'artiste',
                        style: TextStyle(
                          fontSize: AppFonts.subTitleFontSize,
                          color: AppColors.textColor,
                          fontWeight: AppFonts.titleFontWeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const TitlePart(
              // * Lyrics section--------------------------
              leading: 'Lyrics',
              suffix: 'voir plus',
            ),
            SizedBox(
              width: w,
              height: 205,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: 6,
                itemBuilder: (context, index) => Stack(
                  children: [
                    SizedBox(
                      width: w * 0.4,
                      height: 205,
                      child: const Card(
                          // color: AppColors.secondaryColor.withOpacity(0.9),
                          ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: w * 0.4,
                          height: 155,
                          child: const Card(
                            elevation: 0.0,
                            color: Colors.teal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Titre du song',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: AppFonts.subTitleFontSize,
                              color: AppColors.textColor,
                              fontWeight: AppFonts.titleFontWeight,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Nom artiste',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: AppFonts.primaryFontSize,
                              color: AppColors.subTextColor,
                              fontWeight: AppFonts.titleFontWeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            const TitlePart(
              // * Top week section--------------------------
              leading: 'Top de la semaine',
              suffix: 'voir plus',
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, index) => const SizedBox(height: 4),
                itemBuilder: (context, index) => const LyricsListItemWidget(
                  title: 'data',
                  status: 'data',
                  numberLikes: 42,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const TitlePart(
              // * News section--------------------------
              leading: 'Actualités',
              suffix: 'voir plus',
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 2,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                  child: ArticleCardWidget(w: w),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitlePart extends StatelessWidget {
  final String leading;
  final String suffix;
  const TitlePart({
    super.key,
    required this.leading,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            leading,
            style: TextStyle(
              fontSize: AppFonts.titleFontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            suffix,
            style: TextStyle(
              fontSize: AppFonts.subTitleFontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
