import 'package:mocktail/mocktail.dart';

class Listener extends Mock {
  void call(int? previous, int value);
}
