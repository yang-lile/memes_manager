import 'package:freezed_annotation/freezed_annotation.dart';

part 'memes_package_model.freezed.dart';

@freezed
class MemesPackageModel with _$MemesPackageModel {
  const factory MemesPackageModel({
    required String packageName,
    required String author,
    required int count,
  }) = _MemesPackageModel;
}
