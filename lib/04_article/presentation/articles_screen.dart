import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/article_card_widget.dart';

@RoutePage()
class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var scWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualites'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: scWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ArticleCardWidget(w: scWidth * 0.97),
              const SizedBox(height: 12),
              ArticleCardWidget(w: scWidth * 0.97),
              const SizedBox(height: 12),
              ArticleCardWidget(w: scWidth * 0.97),
              const SizedBox(height: 12),
              ArticleCardWidget(w: scWidth * 0.97),
            ],
          ),
        ),
      ),
    );
  }
}
