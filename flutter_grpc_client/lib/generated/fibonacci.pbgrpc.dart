//
//  Generated code. Do not modify.
//  source: fibonacci.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'fibonacci.pb.dart' as $0;

export 'fibonacci.pb.dart';

@$pb.GrpcServiceName('fibonacci.FibonacciService')
class FibonacciServiceClient extends $grpc.Client {
  static final _$getFibonacci = $grpc.ClientMethod<$0.FibonacciRequest, $0.FibonacciResponse>(
      '/fibonacci.FibonacciService/GetFibonacci',
      ($0.FibonacciRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FibonacciResponse.fromBuffer(value));

  FibonacciServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.FibonacciResponse> getFibonacci($0.FibonacciRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFibonacci, request, options: options);
  }
}

@$pb.GrpcServiceName('fibonacci.FibonacciService')
abstract class FibonacciServiceBase extends $grpc.Service {
  $core.String get $name => 'fibonacci.FibonacciService';

  FibonacciServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FibonacciRequest, $0.FibonacciResponse>(
        'GetFibonacci',
        getFibonacci_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FibonacciRequest.fromBuffer(value),
        ($0.FibonacciResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.FibonacciResponse> getFibonacci_Pre($grpc.ServiceCall call, $async.Future<$0.FibonacciRequest> request) async {
    return getFibonacci(call, await request);
  }

  $async.Future<$0.FibonacciResponse> getFibonacci($grpc.ServiceCall call, $0.FibonacciRequest request);
}
