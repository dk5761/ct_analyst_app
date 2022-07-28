import 'package:ct_analyst_app/src/features/home/data/test_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/.env.dart';
import '../domain/task.dart';
import 'package:dio/dio.dart';

abstract class IDailyTaskRepository {
  //fetch the daily tasks.
  Future<List<Task>> fetchDailyTask();
}

final clientProvider = Provider((ref) => Dio(BaseOptions(
    baseUrl: "http://172.30.7.80:3001/dtask/",
    headers: {"authorization": dioToken})));

class DailyTaskRepository implements IDailyTaskRepository {
  final Reader read;

  const DailyTaskRepository(this.read);

  @override
  Future<List<Task>> fetchDailyTask() async {
    final response = await read(clientProvider).get('/getAllTask');

    return List<Task>.from(response.data.map((x) => Task.fromJson(x)));
  }
}

final dailyTaskRepositoryProvider =
    Provider<DailyTaskRepository>((ref) => DailyTaskRepository(ref.read));

final fetchDailyTaskProvider = FutureProvider<List<Task>>((ref) async {
  final dailyTaskRepository = ref.watch(dailyTaskRepositoryProvider);

  return dailyTaskRepository.fetchDailyTask();
});
