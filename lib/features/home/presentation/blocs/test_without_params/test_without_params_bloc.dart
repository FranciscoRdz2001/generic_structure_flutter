import 'package:dartz/dartz.dart';
import 'package:generic_structure_flutter/core/app/blocs/base_data/base_data_bloc.dart';
import 'package:generic_structure_flutter/core/app/blocs/base_data/params/base_data_params.dart';
import 'package:generic_structure_flutter/domain/failures/failure.dart';
import 'package:generic_structure_flutter/features/home/domain/repositories/interfaces/i_test_repository.dart';

class TestWithoutParamsBloc extends BaseDataBloc<int, BaseDataParams> {
  final ITestRepository repository;
  TestWithoutParamsBloc({
    required super.hasConnection,
    required this.repository,
  });

  @override
  Future<Either<Failure, int>> repositoryCall(BaseDataParams? params) {
    return repository.callRepository();
  }
}
