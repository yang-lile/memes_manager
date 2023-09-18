// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memes_package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MemesPackageModel {
  String get packageName => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<MemeModel> get memes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemesPackageModelCopyWith<MemesPackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemesPackageModelCopyWith<$Res> {
  factory $MemesPackageModelCopyWith(
          MemesPackageModel value, $Res Function(MemesPackageModel) then) =
      _$MemesPackageModelCopyWithImpl<$Res, MemesPackageModel>;
  @useResult
  $Res call(
      {String packageName, String author, int count, List<MemeModel> memes});
}

/// @nodoc
class _$MemesPackageModelCopyWithImpl<$Res, $Val extends MemesPackageModel>
    implements $MemesPackageModelCopyWith<$Res> {
  _$MemesPackageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageName = null,
    Object? author = null,
    Object? count = null,
    Object? memes = null,
  }) {
    return _then(_value.copyWith(
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      memes: null == memes
          ? _value.memes
          : memes // ignore: cast_nullable_to_non_nullable
              as List<MemeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemesPackageModelCopyWith<$Res>
    implements $MemesPackageModelCopyWith<$Res> {
  factory _$$_MemesPackageModelCopyWith(_$_MemesPackageModel value,
          $Res Function(_$_MemesPackageModel) then) =
      __$$_MemesPackageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String packageName, String author, int count, List<MemeModel> memes});
}

/// @nodoc
class __$$_MemesPackageModelCopyWithImpl<$Res>
    extends _$MemesPackageModelCopyWithImpl<$Res, _$_MemesPackageModel>
    implements _$$_MemesPackageModelCopyWith<$Res> {
  __$$_MemesPackageModelCopyWithImpl(
      _$_MemesPackageModel _value, $Res Function(_$_MemesPackageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageName = null,
    Object? author = null,
    Object? count = null,
    Object? memes = null,
  }) {
    return _then(_$_MemesPackageModel(
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      memes: null == memes
          ? _value._memes
          : memes // ignore: cast_nullable_to_non_nullable
              as List<MemeModel>,
    ));
  }
}

/// @nodoc

class _$_MemesPackageModel implements _MemesPackageModel {
  const _$_MemesPackageModel(
      {required this.packageName,
      required this.author,
      required this.count,
      required final List<MemeModel> memes})
      : _memes = memes;

  @override
  final String packageName;
  @override
  final String author;
  @override
  final int count;
  final List<MemeModel> _memes;
  @override
  List<MemeModel> get memes {
    if (_memes is EqualUnmodifiableListView) return _memes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memes);
  }

  @override
  String toString() {
    return 'MemesPackageModel(packageName: $packageName, author: $author, count: $count, memes: $memes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemesPackageModel &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._memes, _memes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, packageName, author, count,
      const DeepCollectionEquality().hash(_memes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemesPackageModelCopyWith<_$_MemesPackageModel> get copyWith =>
      __$$_MemesPackageModelCopyWithImpl<_$_MemesPackageModel>(
          this, _$identity);
}

abstract class _MemesPackageModel implements MemesPackageModel {
  const factory _MemesPackageModel(
      {required final String packageName,
      required final String author,
      required final int count,
      required final List<MemeModel> memes}) = _$_MemesPackageModel;

  @override
  String get packageName;
  @override
  String get author;
  @override
  int get count;
  @override
  List<MemeModel> get memes;
  @override
  @JsonKey(ignore: true)
  _$$_MemesPackageModelCopyWith<_$_MemesPackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
