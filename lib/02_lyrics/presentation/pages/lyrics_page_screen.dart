import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamer_lyrics/02_lyrics/business_logic/cubit/lyrics_cubit.dart';
import 'package:kamer_lyrics/shared/utils/app_colors.dart';

import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:kamer_lyrics/shared/utils/app_fonts.dart';
import 'package:kamer_lyrics/shared/widgets/youtube_player_widget.dart';

import '../../data/models/lyrics_model.dart';

@RoutePage()
class LyricsPageScreen extends StatefulWidget {
  final LyricsModel lyricsModel;
  const LyricsPageScreen({
    super.key,
    required this.lyricsModel,
  });

  @override
  State<LyricsPageScreen> createState() => _LyricsPageScreenState();
}

class _LyricsPageScreenState extends State<LyricsPageScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController _commentController;
  @override
  void initState() {
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  var display = false;
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
                                        widget.lyricsModel.title,
                                        style: TextStyle(
                                          color: AppColors.secondaryColor,
                                          fontSize: AppFonts.cardFirstFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // context.router
                                          //     .push(const ArtistRoute());
                                        }, //TODO : Redirect to the artist page
                                        child: Text(
                                          widget.lyricsModel.authors![0].name,
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
                                      onPressed: () {
                                        context.read<LyricsCubit>().likeLyrics(
                                            lyricsId: widget.lyricsModel.id);
                                      }, //TODO : Like ation button
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
                            onTap: () {
                              setState(() {
                                display = !display;
                              });
                            }, //TODO : Open youtube player
                            child: Icon(
                              display ? Icons.stop : Icons.play_arrow_rounded,
                              size: 45,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: display
                        ? const YoutubePlayerWidget()
                        : const SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Les paroles',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          widget.lyricsModel.content,
                          softWrap: true,
                          style: TextStyle(
                            // color: Colors.black,
                            fontSize: AppFonts.subTitleFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Commentaires',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  for (int i = 0;
                      i < widget.lyricsModel.comments!.length;
                      i++) ...[
                    ListTile(
                      leading: const CircleAvatar(radius: 15),
                      title: Text(widget.lyricsModel.comments![i].comment),
                    ),
                  ]
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white.withOpacity(0.5),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: _commentController,
                      onFieldSubmitted: (v) {
                        context.read<LyricsCubit>().commentLyrics(
                              comment: v,
                              lyricsId: widget.lyricsModel.id,
                            );
                      },
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
                        fillColor: Colors.transparent,
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
