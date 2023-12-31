import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamer_lyrics/shared/routes/routes.dart';

import '../../service_locator.dart';
import '../../shared/widgets/lyrics_list_item_widget.dart';
import '../business_logic/cubit/lyrics_cubit.dart';

@RoutePage()
class LyricsScreen extends StatelessWidget {
  const LyricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LyricsCubit, LyricsState>(
        bloc: getIt.get<LyricsCubit>(),
        builder: ((context, state) {
          if (state.isLoadingLyrics) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 50,
              ),
            );
          }

          if (state.errorLoadingLyrics) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 70,
                color: Colors.red,
              ),
            );
          }

          var data = state.lyrics!;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                var item = data[index];
                return LyricsListItemWidget(
                  lyrics: item,
                  onTap: () => context.router.push(
                    LyricsRouteRoute(lyricsModel: item),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
