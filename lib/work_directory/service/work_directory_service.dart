import 'dart:io';

import 'package:memes_manager/app/constant/paths.dart';
import 'package:memes_manager/work_directory/provider/app_document_directory_provider.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_directory_service.g.dart';

@riverpod
WorkDirectoryService workDirectoryService(WorkDirectoryServiceRef ref) =>
    WorkDirectoryService(ref.watch(appDocumentDirectoryProvider));

class WorkDirectoryService {
  WorkDirectoryService(this._appDocumentDir);

  final Directory _appDocumentDir;

  Directory getWorkDirecory() {
    return Directory(joinAll([_appDocumentDir.path, Paths.memesFolder]));
  }
}
