import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:memes_manager/home/view/memes_grid_view.dart';
import 'package:memes_manager/memes_package/model/meme_model.dart';

import '../../helpers/helpers.dart';

void main() {
  testWidgets('memes grid view ...', (tester) async {
    await tester.pumpApp(
      const MemesGridView(
        memes: [
          MemeModel(filePath: 'filePath1'),
          MemeModel(filePath: 'filePath2'),
          MemeModel(filePath: 'filePath3'),
        ],
      ),
    );

    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(3));
    expect(find.image(Image.file(File('filePath1')).image), findsOneWidget);
    expect(find.image(Image.file(File('filePath2')).image), findsOneWidget);
    expect(find.image(Image.file(File('filePath3')).image), findsOneWidget);
  });
}
