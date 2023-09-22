import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memes_manager/home/riverpod/memes_packages_riverpod.dart';
import 'package:memes_manager/home/view/home_page.dart';
import 'package:memes_manager/home/view/memes_grid_view.dart';
import 'package:memes_manager/memes_package/model/meme_model.dart';
import 'package:memes_manager/memes_package/model/memes_package_model.dart';

import '../../helpers/helpers.dart';

void main() {
  group('home page', () {
    testWidgets('with 0 data', (tester) async {
      final list = [
        const MemesPackageModel(
          packageName: 'packageName',
          author: 'author',
          count: 0,
          memes: [],
        ),
      ];
      await tester.pumpApp(
        ProviderScope(
          overrides: [
            getMemesPackagesRiverpodProvider.overrideWith((ref) => list),
          ],
          child: const HomePage(),
        ),
      );
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.byType(Image), findsNothing);
    });
    testWidgets('with some meme data', (tester) async {
      final list = [
        const MemesPackageModel(
          packageName: 'packageName',
          author: 'author',
          count: 3,
          memes: [
            MemeModel(filePath: 'filePath1'),
            MemeModel(filePath: 'filePath2'),
            MemeModel(filePath: 'filePath3'),
          ],
        ),
      ];
      await tester.pumpApp(
        ProviderScope(
          overrides: [
            getMemesPackagesRiverpodProvider
                .overrideWith((ref) => Future.value(list)),
          ],
          child: const HomePage(),
        ),
      );
      // loading...
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // waitting loading.
      await tester.pumpAndSettle();
      // has data!
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(3));
    });
    testWidgets('with some meme package data', (tester) async {
      final list = [
        const MemesPackageModel(
          packageName: 'packageName1',
          author: 'author1',
          count: 1,
          memes: [
            MemeModel(filePath: 'filePath1'),
          ],
        ),
        const MemesPackageModel(
          packageName: 'packageName2',
          author: 'author2',
          count: 2,
          memes: [
            MemeModel(filePath: 'filePath2'),
            MemeModel(filePath: 'filePath3'),
          ],
        ),
        const MemesPackageModel(
          packageName: 'packageName3',
          author: 'author3',
          count: 3,
          memes: [
            MemeModel(filePath: 'filePath1'),
            MemeModel(filePath: 'filePath2'),
            MemeModel(filePath: 'filePath3'),
          ],
        ),
      ];
      await tester.pumpApp(
        ProviderScope(
          overrides: [
            getMemesPackagesRiverpodProvider
                .overrideWith((ref) => Future.value(list)),
          ],
          child: const HomePage(),
        ),
      );
      // loading...
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // waitting loading.
      await tester.pumpAndSettle();
      // has data!
      expect(find.byType(MemesGridView), findsOneWidget);
      expect(find.text('packageName1'), findsOneWidget);
      expect(find.text('packageName2'), findsOneWidget);
      expect(find.text('packageName3'), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(1));

      // scoll to second page
      await tester.fling(
        find.byType(TabBarView),
        const Offset(-200, 0),
        1500,
      );
      await tester.pumpAndSettle();
      expect(find.byType(Image), findsNWidgets(2));

      await tester.fling(
        find.byType(TabBarView),
        const Offset(-200, 0),
        1500,
      );
      await tester.pumpAndSettle();
      expect(find.byType(Image), findsNWidgets(3));
    });
  });
}
