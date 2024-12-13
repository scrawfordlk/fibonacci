//
//  Generated code. Do not modify.
//  source: fibonacci.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use fibonacciRequestDescriptor instead')
const FibonacciRequest$json = {
  '1': 'FibonacciRequest',
  '2': [
    {'1': 'number', '3': 1, '4': 1, '5': 5, '10': 'number'},
  ],
};

/// Descriptor for `FibonacciRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fibonacciRequestDescriptor = $convert.base64Decode(
    'ChBGaWJvbmFjY2lSZXF1ZXN0EhYKBm51bWJlchgBIAEoBVIGbnVtYmVy');

@$core.Deprecated('Use fibonacciResponseDescriptor instead')
const FibonacciResponse$json = {
  '1': 'FibonacciResponse',
  '2': [
    {'1': 'fibNumber', '3': 1, '4': 1, '5': 3, '10': 'fibNumber'},
  ],
};

/// Descriptor for `FibonacciResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fibonacciResponseDescriptor = $convert.base64Decode(
    'ChFGaWJvbmFjY2lSZXNwb25zZRIcCglmaWJOdW1iZXIYASABKANSCWZpYk51bWJlcg==');

