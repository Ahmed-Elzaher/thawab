import 'package:equatable/equatable.dart';
import 'package:thawab/core/errors/failure_code.dart';

abstract class Failure extends Equatable {
  const Failure({required this.code});

  final String code;

  @override
  List<Object?> get props => [code];
}

class DataSourceUnavailableFailure extends Failure {
  const DataSourceUnavailableFailure({
    super.code = FailureCode.dataSourceUnavailable,
  });
}
