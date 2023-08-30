import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamer_lyrics/03_artist/business_logic/cubit/artist_cubit.dart';
import 'package:kamer_lyrics/05_genres/business_logic/cubit/genre_cubit.dart';
import 'package:kamer_lyrics/shared/routes/routes.dart';

import '00_theme/business_logic/cubit/theme_cubit.dart';
import '02_lyrics/business_logic/cubit/lyrics_cubit.dart';
import 'shared/utils/app_colors.dart';
import 'shared/utils/app_fonts.dart';
import 'shared/widgets/article_card_widget.dart';
import 'shared/widgets/category_grid_item_widget.dart';
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
  var displayNumber = 0;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: ListView(
          children: [
            // * Home Header Section ----------------------------------------------
            BlocBuilder<LyricsCubit, LyricsState>(
              builder: (context, state) {
                if (state.errorLoadingLyrics) {
                  //TODO : To replace by shimmer effect
                  return const CupertinoActivityIndicator();
                }
                if (state.isLoadingLyrics) {
                  //TODO : To replace by shimmer effect
                  return const CupertinoActivityIndicator();
                }

                var data = state.lyrics!;
                displayNumber = 4;
                return CarouselSlider.builder(
                  carouselController: CarouselController(),
                  itemCount: displayNumber,
                  itemBuilder: (context, index, realIndex) =>
                      LyricsSliderItemWidget(
                    artistName: 'Nom de l\'artiste',
                    lyrics: data[index],
                  ),
                  options: CarouselOptions(
                    enlargeFactor: 0.2,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    onPageChanged: (index, reason) {
                      setState(() {
                        color = Colors.blueGrey;
                        indexScroll = index;
                      });
                    },
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < displayNumber; i++) ...[
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
            // * Home Categories Section ----------------------------------------------
            BlocBuilder<GenreCubit, GenreState>(
              builder: (context, state) {
                if (state.errorLoadingGenres) {
                  //TODO : To replace by shimmer effect
                  return Container();
                }

                if (state.isLoadingGenres) {
                  //TODO : To replace by shimmer effect
                  return Container();
                }

                var data = state.genres!;

                return Column(
                  children: [
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        children: [
                          for (int i = 0; i < 6; i++) ...[
                            CategoryGridItemWidget(
                              genre: data[i],
                            )
                          ],
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 12),
            // * Home Artists Section ----------------------------------------------
            BlocBuilder<ArtistCubit, ArtistState>(
              builder: (context, state) {
                if (state.errorLoadingArtists) {
                  //TODO :
                  return Container();
                }
                if (state.isLoadingArtists) {
                  //TODO :
                  return Container();
                }
                var data = state.artists!;
                return Column(
                  children: [
                    const TitlePart(
                      // * Artist section--------------------------
                      leading: 'Top artistes',
                      suffix: 'voir plus',
                    ),
                    SizedBox(
                      width: screenWidth,
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
                              SizedBox(
                                width: 90,
                                child: Text(
                                  data[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: AppFonts.subTitleFontSize,
                                    color: AppColors.textColor,
                                    fontWeight: AppFonts.titleFontWeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 12),
            // * Home Lyrics Section ----------------------------------------------
            BlocBuilder<LyricsCubit, LyricsState>(
              builder: (context, state) {
                if (state.errorLoadingLyrics) {
                  //TODO :
                  return Container();
                }
                if (state.isLoadingLyrics) {
                  //TODO :
                  return Container();
                }
                var data = state.lyrics!;
                return Column(
                  children: [
                    const TitlePart(
                      // * Lyrics section--------------------------
                      leading: 'Lyrics',
                      suffix: 'voir plus',
                    ),
                    SizedBox(
                      width: screenWidth,
                      height: 205,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemCount: 6,
                        itemBuilder: (context, index) => Stack(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.4,
                              height: 205,
                              child: const Card(
                                  // color: AppColors.secondaryColor.withOpacity(0.9),
                                  ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.4,
                                  height: 155,
                                  child: const Card(
                                    elevation: 0.0,
                                    color: Colors.teal,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    data[index].title,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontSize: AppFonts.subTitleFontSize,
                                      color: AppColors.textColor,
                                      fontWeight: AppFonts.titleFontWeight,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    (data[index].authors)![0].name,
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
                  ],
                );
              },
            ),
            const SizedBox(height: 12),
            // * Home Top week Section ----------------------------------------------
            BlocBuilder<LyricsCubit, LyricsState>(
              builder: (context, state) {
                if (state.errorLoadingLyrics) {
                  return Container(); // TODO :
                }
                if (state.isLoadingLyrics) {
                  return Container(); // TODO :
                }
                var data = state.lyrics!;
                return Column(
                  children: [
                    const TitlePart(
                      // * Top week section--------------------------
                      leading: 'Top de la semaine',
                      suffix: 'voir plus',
                    ),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 4),
                      itemBuilder: (context, index) => LyricsListItemWidget(
                        lyrics: data[index],
                        onTap: () {
                          context.router
                              .push(LyricsRouteRoute(lyricsModel: data[index]));
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 12),
            // * Home News Section ----------------------------------------------
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
                  child: ArticleCardWidget(w: screenWidth),
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
              // color: AppColors.textColor,
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
//TODO : make shimmer loading effect
// Shimmer shimmerLoading() {
//   return Shimmer.fromColors(
//     baseColor: Colors.grey[300]!,
//     highlightColor: Colors.grey[100]!,
//     child: child,
//   );
// }
