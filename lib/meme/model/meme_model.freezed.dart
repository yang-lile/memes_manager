// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MemeModel {
  String get filePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemeModelCopyWith<MemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemeModelCopyWith<$Res> {
  factory $MemeModelCopyWith(MemeModel value, $Res Function(MemeModel) then) =
      _$MemeModelCopyWithImpl<$Res, MemeModel>;
  @useResult
  $Res call({String filePath});
}

/// @nodoc
class _$MemeModelCopyWithImpl<$Res, $Val extends MemeModel>
    implements $MemeModelCopyWith<$Res> {
  _$MemeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_value.copyWith(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemeModelCopyWith<$Res> implements $MemeModelCopyWith<$Res> {
  factory _$$_MemeModelCopyWith(
          _$_MemeModel value, $Res Function(_$_MemeModel) then) =
      __$$_MemeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String filePath});
}

/// @nodoc
class __$$_MemeModelCopyWithImpl<$Res>
    extends _$MemeModelCopyWithImpl<$Res, _$_MemeModel>
    implements _$$_MemeModelCopyWith<$Res> {
  __$$_MemeModelCopyWithImpl(
      _$_MemeModel _value, $Res Function(_$_MemeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_$_MemeModel(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MemeModel implements _MemeModel {
  const _$_MemeModel({required this.filePath});

  @override
  final String filePath;

  @override
  String toString() {
    return 'MemeModel(filePath: $filePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemeModel &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemeModelCopyWith<_$_MemeModel> get copyWith =>
      __$$_MemeModelCopyWithImpl<_$_MemeModel>(this, _$identity);
}

abstract class _MemeModel implements MemeModel {
  const factory _MemeModel({required final String filePath}) = _$_MemeModel;

  @override
  String get filePath;
  @override
  @JsonKey(ignore: true)
  _$$_MemeModelCopyWith<_$_MemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
