import 'package:generic_structure_flutter/features/home/domain/datasources/interfaces/i_test_datasource.dart';

class TestDataSource implements ITestDatasource {
  @override
  Future<int> getTest() {
    return Future.value(1);
  }
}
