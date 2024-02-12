import 'package:dartz/dartz.dart';
import 'package:generic_structure_flutter/domain/failures/failure.dart';
import 'package:generic_structure_flutter/domain/repositories/i_base_repository.dart';

class ITestRepository extends IBaseRepository<int> {
  @override
  Future<Either<Failure, int>> callRepository({Map<String, dynamic>? params}) {
    return Future.value(const Right(1));
  }
}
