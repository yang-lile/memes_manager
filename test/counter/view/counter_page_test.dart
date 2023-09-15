import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memes_manager/counter/counter.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const ProviderScope(child: CounterPage()));
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterView', () {
    // late CounterCubit counterCubit;

    // setUp(() {
    //   counterCubit = MockCounterCubit();
    // });

    testWidgets('renders current count', (tester) async {
      const state = 0;
      await tester.pumpApp(
        const ProviderScope(
          child: CounterView(),
        ),
      );
      // when(() => counterProvider,)
      // when(() => counterCubit.state).thenReturn(state);
      // await tester.pumpApp(
      //   BlocProvider.value(
      //     value: counterCubit,
      //     child: const CounterView(),
      //   ),
      // );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      final container = ProviderContainer();
      await tester.pumpApp(
        ProviderScope(
          parent: container,
          child: const CounterView(),
        ),
      );
      // when(() => counterCubit.state).thenReturn(0);
      // when(() => counterCubit.increment()).thenReturn(null);
      // await tester.pumpApp(
      //   BlocProvider.value(
      //     value: counterCubit,
      //     child: const CounterView(),
      //   ),
      // );
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      final container = ProviderContainer();
      await tester.pumpApp(
        ProviderScope(
          parent: container,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('-1'), findsOneWidget);
    });
  });
}
