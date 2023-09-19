import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_model.freezed.dart';

@freezed
class MemeModel with _$MemeModel {
  const factory MemeModel({
    required String filePath,
  }) = _MemeModel;
}
