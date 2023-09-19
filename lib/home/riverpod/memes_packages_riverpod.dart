import 'package:memes_manager/memes_package/model/memes_package_model.dart';
import 'package:memes_manager/memes_package/repository/memes_package_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memes_packages_riverpod.g.dart';

@riverpod
Future<List<MemesPackageModel>> getMemesPackagesRiverpod(
  GetMemesPackagesRiverpodRef ref,
) {
  final memesPackageRepository = ref.watch(memesPackageRepositoryProvider);
  return memesPackageRepository.getAllMemesPackage();
}
