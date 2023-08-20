import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kamer_lyrics/shared/widgets/input_form_field.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 50,
            child: InputFormField(
              hintText: 'Search : Lyrics, Artist, Album...',
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Text('GENRES'),
            Text('LYRICS'),
            Text('ARTISTS'),
            Text('TOP 30'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_sharp),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Genre')),
          Center(child: Text('Lyrics')),
          Center(child: Text('Artist')),
          Center(child: Text('Top 30')),
        ],
      ),
    );
  }
}
