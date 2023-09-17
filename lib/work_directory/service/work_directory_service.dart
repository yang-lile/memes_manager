import 'dart:io';

import 'package:memes_manager/work_directory/provider/app_document_directory_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_directory_service.g.dart';

@riverpod
WorkDirectoryService workDirectoryService(WorkDirectoryServiceRef ref) =>
    WorkDirectoryService(ref.watch(appDocumentDirectoryProvider));

class WorkDirectoryService {
  WorkDirectoryService(this.appDocumentDir);

  Directory appDocumentDir;

  Directory getWorkDirecory() {
    return appDocumentDir;
  }
}
