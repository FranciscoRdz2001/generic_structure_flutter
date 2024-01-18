import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_structure_flutter/core/app/blocs/base_data/base_data_bloc.dart';
import 'package:generic_structure_flutter/core/app/services/internet_service.dart';
import 'package:generic_structure_flutter/features/home/domain/datasources/test_datasource.dart';
import 'package:generic_structure_flutter/features/home/domain/repositories/test_repository.dart';
import 'package:generic_structure_flutter/features/home/presentation/blocs/params/test_query_params.dart';
import 'package:generic_structure_flutter/features/home/presentation/blocs/test_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestBloc(
        hasConnection: HasConnection(),
        repository: TestRepository(
          dataSource: TestDataSource(),
        ),
      )..add(
          CallAction(
            params: const TestQueryParams(
              id: 1,
            ),
          ),
        ),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: BlocBuilder<TestBloc, BaseDataState<int>>(
        builder: (context, state) {
          return const Center(
            child: Text('Home Page'),
          );
        },
      ),
    );
  }
}
