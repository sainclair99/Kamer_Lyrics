import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service_locator.dart';
import '../../shared/widgets/lyrics_list_item_widget.dart';
import '../business_logic/cubit/lyrics_cubit.dart';

@RoutePage()
class LyricsScreen extends StatelessWidget {
  const LyricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      // appBar: AppBar(
      //   elevation: 5,
      //   title: const Text('Lyrics Screen'),
      //   centerTitle: true,
      // ),
      body: BlocBuilder<LyricsCubit, LyricsState>(
        bloc: getIt.get<LyricsCubit>()..fetchAllLyrics(),
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

          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              var item = data[index];
              return LyricsListItemWidget(
                title: item.titre,
                status: item.status,
                numberLikes: 10,
                imageUrl: item.image,
              );
            },
          );
        }),
      ),
    );
  }
}
