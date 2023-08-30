import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kamer_lyrics/shared/utils/app_colors.dart';
import 'package:kamer_lyrics/shared/utils/app_fonts.dart';
import 'package:kamer_lyrics/shared/widgets/input_form_field.dart';

import '../../../shared/widgets/submit_button.dart';

@RoutePage()
class LyricsFormScreen extends StatefulWidget {
  const LyricsFormScreen({super.key});

  @override
  State<LyricsFormScreen> createState() => _LyricsFormScreenState();
}

class _LyricsFormScreenState extends State<LyricsFormScreen> {
  late TextEditingController _titleController;
  late TextEditingController _statusController;
  late TextEditingController _artistController;
  late TextEditingController _videoController;
  late TextEditingController _lyricsController;
  late GlobalKey<FormState> _formKey;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _titleController = TextEditingController();
    _statusController = TextEditingController();
    _artistController = TextEditingController();
    _videoController = TextEditingController();
    _lyricsController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
          icon: Icon(
            Icons.menu,
            color: AppColors.primaryColor,
            size: 35,
          ),
        ),
        title: Text(
          'Ajouter des paroles',
          style: TextStyle(
            fontSize: AppFonts.titleFontSize,
            fontWeight: AppFonts.titleFontWeight,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top + 5),
                  const SizedBox(height: 8),
                  InputFormField(
                    controller: _titleController,
                    label: 'Titre',
                    labelSize: AppFonts.subTitleFontSize,
                    borderRadius: 5,
                  ),
                  const SizedBox(height: 8),
                  InputFormField(
                    controller: _statusController,
                    label: 'Status',
                    labelSize: AppFonts.subTitleFontSize,
                    borderRadius: 5,
                  ),
                  const SizedBox(height: 8),
                  InputFormField(
                    controller: _artistController,
                    label: 'Artiste(s)',
                    labelSize: AppFonts.subTitleFontSize,
                    borderRadius: 5,
                  ),
                  const SizedBox(height: 8),
                  InputFormField(
                    controller: _videoController,
                    keyboardType: TextInputType.url,
                    label: 'Lien Youtube',
                    labelSize: AppFonts.subTitleFontSize,
                    borderRadius: 5,
                  ),
                  const SizedBox(height: 8),
                  InputFormField(
                    controller: _lyricsController,
                    label: 'Paroles',
                    height: 150,
                    labelSize: AppFonts.subTitleFontSize,
                    borderRadius: 5,
                    maxLines: 500,
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(height: 8),
                  SubmitButton(
                    width: MediaQuery.of(context).size.width,
                    text: 'Envoyer',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
