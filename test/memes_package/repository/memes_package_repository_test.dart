import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memes_manager/memes_package/model/meme_model.dart';
import 'package:memes_manager/memes_package/model/memes_package_model.dart';
import 'package:memes_manager/memes_package/repository/memes_package_repository.dart';
import 'package:memes_manager/work_directory/service/work_directory_service.dart';
import 'package:mocktail/mocktail.dart';

class MockWorkDirectoryService extends Mock implements WorkDirectoryService {}

class MockDirectory extends Mock implements Directory {}

class MockFileStat extends Mock implements FileStat {}

class MockMemesPackageRepository extends Mock
    implements MemesPackageRepository {}

void main() {
  late MockWorkDirectoryService mockWorkDirectoryService;
  late MockDirectory mockDirectory;
  late MockDirectory mockSubDirectory1;
  late MockFileStat mockFileStat;
  group('MemesPackageRepository getAllMemesPackage', () {
    setUpAll(
      () {
        // init mocks
        mockWorkDirectoryService = MockWorkDirectoryService();
        mockDirectory = MockDirectory();
        mockSubDirectory1 = MockDirectory();
        mockFileStat = MockFileStat();

        // impl mock filestat
        when(() => mockFileStat.type)
            .thenReturn(FileSystemEntityType.directory);
        // impl mock directory
        when(() => mockDirectory.path).thenReturn('root/memes');
        // impl mock sub directory1
        when(mockSubDirectory1.statSync).thenReturn(mockFileStat);
        when(() => mockSubDirectory1.path).thenReturn('root/memes/name_author');
        // impl mock work directory service
        when(mockWorkDirectoryService.getWorkDirecory)
            .thenReturn(mockDirectory);
      },
    );
    test('memes package repository ...', () async {
      final memesPackageRepository =
          MemesPackageRepository(WorkDirectoryService(Directory('root')));
      expect(memesPackageRepository, isA<MemesPackageRepository>());
    });
    test('base mocks test', () async {
      // impl mock directory
      when(mockDirectory.list).thenAnswer(
        (invocation) {
          return Stream.fromIterable([
            mockSubDirectory1,
            File('3'),
          ]);
        },
      );
      // impl mock sub directory1
      when(mockSubDirectory1.list).thenAnswer(
        (invocation) {
          return Stream.fromIterable(<FileSystemEntity>[]);
        },
      );

      // create running env
      final container = ProviderContainer(
        overrides: [
          workDirectoryServiceProvider
              .overrideWithValue(mockWorkDirectoryService),
        ],
      );

      // test filestat
      expect(mockFileStat.type, FileSystemEntityType.directory);

      // test getWorkDirectory
      final workDirectoryService = container.read(workDirectoryServiceProvider);
      expect(workDirectoryService.getWorkDirecory().path, 'root/memes');
      expect(mockDirectory.path, 'root/memes');
      expect(
        await mockDirectory.list().toList(),
        equals([
          isA<MockDirectory>().having(
            (p0) => p0.path,
            '目录1包含root/memes/name_author',
            'root/memes/name_author',
          ),
          isA<File>().having((p0) => p0.path, '路径为3', '3'),
        ]),
      );
    });
    test('getAllMemesPackage mock test without memes', () async {
      // impl mock directory
      when(mockDirectory.list).thenAnswer(
        (invocation) {
          return Stream.fromIterable([
            mockSubDirectory1,
            File('3'),
          ]);
        },
      );
      // impl mock sub directory1
      when(mockSubDirectory1.list).thenAnswer(
        (invocation) {
          return Stream.fromIterable(<FileSystemEntity>[]);
        },
      );

      // create running env
      final container = ProviderContainer(
        overrides: [
          workDirectoryServiceProvider
              .overrideWithValue(mockWorkDirectoryService),
        ],
      );

      // test getAllMemesPackage without memes
      final memesPackageRepository =
          container.read(memesPackageRepositoryProvider);
      final allMemesPackage = await memesPackageRepository.getAllMemesPackage();
      expect(
        allMemesPackage,
        equals([
          const MemesPackageModel(
            packageName: 'name',
            author: 'author',
            count: 0,
            memes: [],
          ),
        ]),
      );
    });
    test('getAllMemesPackage mock test with memes', () async {
      // impl mock directory
      when(mockDirectory.list).thenAnswer(
        (invocation) {
          return Stream.fromIterable([
            mockSubDirectory1,
            File('3'),
          ]);
        },
      );
      // impl mock sub directory1
      when(mockSubDirectory1.list).thenAnswer(
        (invocation) {
          return Stream.fromIterable([
            File('root/memes/name_author/1.jpg'),
            File('root/memes/name_author/2.jpg'),
            File('root/memes/name_author/3.jpg'),
            File('root/memes/name_author/4.jpg'),
          ]);
        },
      );

      // create running env
      final container = ProviderContainer(
        overrides: [
          workDirectoryServiceProvider
              .overrideWithValue(mockWorkDirectoryService),
        ],
      );

      // test getAllMemesPackage with memes
      final memesPackageRepository =
          container.read(memesPackageRepositoryProvider);
      final allMemesPackage = await memesPackageRepository.getAllMemesPackage();
      expect(
        allMemesPackage,
        equals([
          const MemesPackageModel(
            packageName: 'name',
            author: 'author',
            count: 4,
            memes: [
              MemeModel(filePath: 'root/memes/name_author/1.jpg'),
              MemeModel(filePath: 'root/memes/name_author/2.jpg'),
              MemeModel(filePath: 'root/memes/name_author/3.jpg'),
              MemeModel(filePath: 'root/memes/name_author/4.jpg'),
            ],
          ),
        ]),
      );
    });
  });
}
