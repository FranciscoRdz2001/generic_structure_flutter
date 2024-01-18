import 'package:generic_structure_flutter/core/app/blocs/base_data/base_data_bloc.dart';
import 'package:generic_structure_flutter/features/home/domain/repositories/interfaces/i_test_repository.dart';
import 'package:generic_structure_flutter/features/home/presentation/blocs/params/test_query_params.dart';

class TestBloc extends BaseDataBloc<int, ITestRepository, TestQueryParams> {
  TestBloc({required super.hasConnection, required super.repository});
}
