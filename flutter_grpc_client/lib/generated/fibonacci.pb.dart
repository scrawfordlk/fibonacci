//
//  Generated code. Do not modify.
//  source: fibonacci.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class FibonacciRequest extends $pb.GeneratedMessage {
  factory FibonacciRequest({
    $core.int? number,
  }) {
    final $result = create();
    if (number != null) {
      $result.number = number;
    }
    return $result;
  }
  FibonacciRequest._() : super();
  factory FibonacciRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FibonacciRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FibonacciRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fibonacci'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'number', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FibonacciRequest clone() => FibonacciRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FibonacciRequest copyWith(void Function(FibonacciRequest) updates) => super.copyWith((message) => updates(message as FibonacciRequest)) as FibonacciRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FibonacciRequest create() => FibonacciRequest._();
  FibonacciRequest createEmptyInstance() => create();
  static $pb.PbList<FibonacciRequest> createRepeated() => $pb.PbList<FibonacciRequest>();
  @$core.pragma('dart2js:noInline')
  static FibonacciRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FibonacciRequest>(create);
  static FibonacciRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get number => $_getIZ(0);
  @$pb.TagNumber(1)
  set number($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);
}

class FibonacciResponse extends $pb.GeneratedMessage {
  factory FibonacciResponse({
    $fixnum.Int64? fibNumber,
  }) {
    final $result = create();
    if (fibNumber != null) {
      $result.fibNumber = fibNumber;
    }
    return $result;
  }
  FibonacciResponse._() : super();
  factory FibonacciResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FibonacciResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FibonacciResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fibonacci'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fibNumber', protoName: 'fibNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FibonacciResponse clone() => FibonacciResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FibonacciResponse copyWith(void Function(FibonacciResponse) updates) => super.copyWith((message) => updates(message as FibonacciResponse)) as FibonacciResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FibonacciResponse create() => FibonacciResponse._();
  FibonacciResponse createEmptyInstance() => create();
  static $pb.PbList<FibonacciResponse> createRepeated() => $pb.PbList<FibonacciResponse>();
  @$core.pragma('dart2js:noInline')
  static FibonacciResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FibonacciResponse>(create);
  static FibonacciResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fibNumber => $_getI64(0);
  @$pb.TagNumber(1)
  set fibNumber($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFibNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearFibNumber() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
