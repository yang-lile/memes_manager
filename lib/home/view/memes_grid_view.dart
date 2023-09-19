import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memes_manager/memes_package/model/meme_model.dart';

class MemesGridView extends ConsumerWidget {
  const MemesGridView({
    required this.memes,
    super.key,
  });

  final List<MemeModel> memes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
      ),
      itemCount: memes.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Image.file(File(memes[index].filePath)),
        );
      },
    );
  }
}
