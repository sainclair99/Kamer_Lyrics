import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamer_lyrics/03_artist/business_logic/cubit/artist_cubit.dart';
import 'package:kamer_lyrics/shared/routes/routes.dart';

import '../../service_locator.dart';
import '../../shared/widgets/artist_list_item_widget.dart';

@RoutePage()
class ArtistsScreen extends StatelessWidget {
  const ArtistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArtistCubit, ArtistState>(
        bloc: getIt.get<ArtistCubit>(),
        builder: ((context, state) {
          if (state.isLoadingArtists) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 50,
              ),
            );
          }

          if (state.errorLoadingArtists) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 70,
                color: Colors.red,
              ),
            );
          }

          var data = state.artists!;

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                var item = data[index];
                return ArtistListItemWidget(
                  title: item.name,
                  status: item.musicalGenre,
                  numberLikes: 10,
                  onTap: () {
                    context.router.push(ArtistRoute(artistModel: item));
                  },
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
