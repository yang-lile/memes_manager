import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memes_manager/counter/counter.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      final container = ProviderContainer();
      final listener = Listener();
      container.listen(counterProvider, listener.call, fireImmediately: true);
      verify(() => listener(null, 0)).called(1);
      verifyNoMoreInteractions(listener);
    });

    test('state increase', () {
      final container = ProviderContainer();
      final listener = Listener();
      container.listen(counterProvider, listener.call, fireImmediately: true);
      verify(() => listener(null, 0)).called(1);
      verifyNoMoreInteractions(listener);

      // call state +1
      container.read(counterProvider.notifier).increment();

      verify(() => listener(0, 1)).called(1);
      verifyNoMoreInteractions(listener);
    });

    test('state decrease', () {
      final container = ProviderContainer();
      final listener = Listener();
      container.listen(counterProvider, listener.call, fireImmediately: true);
      verify(() => listener(null, 0)).called(1);
      verifyNoMoreInteractions(listener);

      // call state +1
      container.read(counterProvider.notifier).decrement();

      verify(() => listener(0, -1)).called(1);
      verifyNoMoreInteractions(listener);
    });
  });
}
