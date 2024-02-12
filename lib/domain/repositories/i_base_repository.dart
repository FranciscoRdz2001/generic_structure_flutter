import 'package:dartz/dartz.dart';
import 'package:generic_structure_flutter/domain/failures/failure.dart';

abstract class IBaseRepository<T> {
  Future<Either<Failure, T>> callRepository({Map<String, dynamic>? params});
}
