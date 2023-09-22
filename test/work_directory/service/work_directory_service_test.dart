import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:memes_manager/work_directory/service/work_directory_service.dart';

void main() {
  test('work directory service can init', () async {
    final service = WorkDirectoryService(Directory('path'));

    expect(service, isInstanceOf<WorkDirectoryService>());
  });

  test('work directory service getWorkDirectory', () async {
    final service = WorkDirectoryService(Directory('path'));

    expect(service.getWorkDirecory().path, 'path/memes');
  });
}
