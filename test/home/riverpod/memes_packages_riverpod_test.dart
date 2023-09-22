import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memes_manager/home/riverpod/memes_packages_riverpod.dart';
import 'package:memes_manager/memes_package/model/memes_package_model.dart';
import 'package:memes_manager/memes_package/repository/memes_package_repository.dart';
import 'package:mocktail/mocktail.dart';

class _MockMemesPackageRepository extends Mock
    implements MemesPackageRepository {}

void main() {
  test('memes packages riverpod init state', () async {
    final mockMemesPackageRepository = _MockMemesPackageRepository();
    when(mockMemesPackageRepository.getAllMemesPackage)
        .thenAnswer((invocation) => Future.value([]));

    final container = ProviderContainer(
      overrides: [
        memesPackageRepositoryProvider
            .overrideWithValue(mockMemesPackageRepository),
      ],
    );
    addTearDown(container.dispose);

    container.read(getMemesPackagesRiverpodProvider);

    expect(
      container.read(getMemesPackagesRiverpodProvider),
      const AsyncLoading<List<MemesPackageModel>>(),
    );
  });
  test('memes packages riverpod loaded data', () async {
    final mockMemesPackageRepository = _MockMemesPackageRepository();
    when(mockMemesPackageRepository.getAllMemesPackage)
        .thenAnswer((invocation) => Future.value([]));

    final container = ProviderContainer(
      overrides: [
        memesPackageRepositoryProvider
            .overrideWithValue(mockMemesPackageRepository),
      ],
    );
    addTearDown(container.dispose);
    container.listen<Future<List<MemesPackageModel>>>(
      getMemesPackagesRiverpodProvider.future,
      (previous, next) {},
    );

    expect(
      container.read(getMemesPackagesRiverpodProvider),
      const AsyncLoading<List<MemesPackageModel>>(),
    );

    await container.read(getMemesPackagesRiverpodProvider.future);

    expect(
      container.read(getMemesPackagesRiverpodProvider).value,
      isA<List<MemesPackageModel>>(),
    );
  });
}
