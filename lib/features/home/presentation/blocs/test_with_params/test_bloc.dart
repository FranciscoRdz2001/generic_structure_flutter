import 'package:dartz/dartz.dart';
import 'package:generic_structure_flutter/core/app/blocs/base_data/base_data_bloc.dart';
import 'package:generic_structure_flutter/domain/failures/failure.dart';
import 'package:generic_structure_flutter/features/home/domain/repositories/test_repository.dart';
import 'package:generic_structure_flutter/features/home/presentation/blocs/test_with_params/params/test_query_params.dart';

class TestWithParamsBloc extends BaseDataBloc<int, TestQueryParams> {
  final TestRepository repository;
  TestWithParamsBloc({required super.hasConnection, required this.repository});

  @override
  Future<Either<Failure, int>> repositoryCall(TestQueryParams? params) {
    return repository.callRepository(params: params?.toMap());
  }
}
