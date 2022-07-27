import 'package:ct_analyst_app/src/features/home/data/test_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/task.dart';
import 'package:dio/dio.dart';

abstract class IFetchFridayTaskRepository {
  //fetch the daily tasks.
  Future<List<Task>> fetchFridayTask();
}

final clientProvider = Provider((ref) => Dio(BaseOptions(baseUrl: "")));

class FetchFridayTaskRepository implements IFetchFridayTaskRepository {
  final Reader read;

  const FetchFridayTaskRepository(this.read);

  @override
  Future<List<Task>> fetchFridayTask() async {
    // TODO: implement fetching data from node server

    await Future.delayed(const Duration(seconds: 2));

    // return List<Task>.from(kTaskList.map((x) => Task.fromJson(x)));
    throw UnimplementedError();
  }
}

final dailyTaskRepositoryProvider = Provider<FetchFridayTaskRepository>(
    (ref) => FetchFridayTaskRepository(ref.read));
