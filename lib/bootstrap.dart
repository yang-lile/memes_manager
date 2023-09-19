import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memes_manager/app/logger/app_log.dart';
import 'package:memes_manager/work_directory/provider/app_document_directory_provider.dart';
import 'package:path_provider/path_provider.dart';

class AppProviderObserver extends ProviderObserver {
  const AppProviderObserver();

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.t('''
didAddProvider{
  provider: ${provider.name ?? provider.runtimeType}, container: $container,
  initValue: $value,
}''');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.e('''
providerDidFail{
  provider: ${provider.name ?? provider.runtimeType}, container: $container,
  error: $error, stackTrace: $stackTrace, 
}''');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.t('''
didUpdateProvider{
  provider: ${provider.name ?? provider.runtimeType}, container: $container,
  previousValue: $previousValue,
  newValue: $newValue,
}''');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    logger.d('''
didDisposeProvider{
  provider: ${provider.name ?? provider.runtimeType},
  container: $container,
}''');
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Add cross-flavor configuration here
  WidgetsFlutterBinding.ensureInitialized();

  final appDocDirectory = await getApplicationDocumentsDirectory();

  runApp(
    ProviderScope(
      overrides: [
        appDocumentDirectoryProvider.overrideWithValue(appDocDirectory),
      ],
      child: await builder(),
    ),
  );
}
