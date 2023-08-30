import 'package:flutter/material.dart';

import '../article_screen.dart';


class ArticleCardWidget extends StatelessWidget {
  const ArticleCardWidget({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      width: w,
      height: 283,
      color: Colors.grey.withOpacity(0.2),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArticleScreen(),
            ),
          );
        }, //TODO : Navigate to article details page
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Actus',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        height: 2,
                        color: Colors.black87.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 151, 150, 150),
              height: 139,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  width: w,
                  color: Colors.teal.withOpacity(0.1),
                ),
              ),
            ),
            const Text('nom de l\'auteur / date'),
          ],
        ),
      ),
    );
  }
}
