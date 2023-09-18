import 'dart:io';

import 'package:memes_manager/meme/model/meme_model.dart';
import 'package:memes_manager/memes_package/model/memes_package_model.dart';
import 'package:memes_manager/work_directory/service/work_directory_service.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memes_package_repository.g.dart';

@riverpod
MemesPackageRepository memesPackageRepository(MemesPackageRepositoryRef ref) =>
    MemesPackageRepository(ref.watch(workDirectoryServiceProvider));

class MemesPackageRepository {
  MemesPackageRepository(this._workDirectoryService);

  final WorkDirectoryService _workDirectoryService;

  Future<List<MemesPackageModel>> getAllMemesPackage() async {
    final workDirectory = _workDirectoryService.getWorkDirecory();
    final workDirectories = workDirectory.list();
    final memesPackageModels = <MemesPackageModel>[];

    await for (final element in workDirectories) {
      if (element.statSync().type == FileSystemEntityType.directory) {
        final directory = element as Directory;

        final basenameWithoutExtension =
            p.basenameWithoutExtension(directory.path);
        final split = basenameWithoutExtension.split('_');
        final count = await directory.list().length;
        final memes = directory.listSync().map((e) {
          return MemeModel(filePath: e.path);
        }).toList();

        final memesPackageModel = MemesPackageModel(
          packageName: split[0],
          author: split[1],
          count: count,
          memes: memes,
        );

        memesPackageModels.add(memesPackageModel);
      }
    }
    return memesPackageModels;
  }
}
