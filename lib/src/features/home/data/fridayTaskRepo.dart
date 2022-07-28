import 'package:ct_analyst_app/src/features/home/data/test_list.dart';
import 'package:ct_analyst_app/src/features/home/domain/friday_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/.env.dart';
import '../domain/task.dart';
import 'package:dio/dio.dart';

abstract class IFetchFridayTaskRepository {
  //fetch the daily tasks.
  Future<FridayTask> fetchFridayTask();
}

final clientProvider = Provider((ref) => Dio(BaseOptions(
    baseUrl: "http://172.30.7.80:3001/ftask/",
    headers: {"authorization": dioToken})));

class FetchFridayTaskRepository implements IFetchFridayTaskRepository {
  final Reader read;

  const FetchFridayTaskRepository(this.read);

  @override
  Future<FridayTask> fetchFridayTask() async {
    final response = await read(clientProvider).get('/getFTask');

    final fTask = FridayTask.fromJson(response.data);

    return fTask;
  }
}

final fridayTaskRepositoryProvider = Provider<FetchFridayTaskRepository>(
    (ref) => FetchFridayTaskRepository(ref.read));

final fetchFridayTaskProvider = FutureProvider<FridayTask>((ref) async {
  final fridayTaskRepository = ref.watch(fridayTaskRepositoryProvider);

  return fridayTaskRepository.fetchFridayTask();
});
