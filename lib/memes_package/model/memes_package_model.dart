import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memes_manager/memes_package/model/meme_model.dart';

part 'memes_package_model.freezed.dart';

@freezed
class MemesPackageModel with _$MemesPackageModel {
  const factory MemesPackageModel({
    required String packageName,
    required String author,
    required int count,
    required List<MemeModel> memes,
  }) = _MemesPackageModel;
}
