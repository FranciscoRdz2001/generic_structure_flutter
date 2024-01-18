import 'package:dartz/dartz.dart';
import 'package:generic_structure_flutter/domain/failures/failure.dart';
import 'package:generic_structure_flutter/features/home/domain/datasources/interfaces/i_test_datasource.dart';
import 'package:generic_structure_flutter/features/home/domain/repositories/interfaces/i_test_repository.dart';

class TestRepository implements ITestRepository {
  final ITestDatasource dataSource;

  const TestRepository({required this.dataSource});

  @override
  Future<Either<Failure, int>> callRepository(
      Map<String, dynamic>? params) async {
    try {
      final data = await dataSource.getTest();
      return Right(data);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
