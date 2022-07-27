import 'package:ct_analyst_app/src/features/home/data/test_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/task.dart';
import 'package:dio/dio.dart';

abstract class IDailyTaskRepository {
  //fetch the daily tasks.
  Future<List<Task>> fetchDailyTask();
}

final clientProvider = Provider((ref) => Dio(BaseOptions(baseUrl: "")));

class DailyTaskRepository implements IDailyTaskRepository {
  final Reader read;

  const DailyTaskRepository(this.read);

  @override
  Future<List<Task>> fetchDailyTask() async {
    // TODO: implement fetching data from node server

    await Future.delayed(const Duration(seconds: 2));

    return List<Task>.from(kTaskList.map((x) => Task.fromJson(x)));
  }
}

final dailyTaskRepositoryProvider =
    Provider<DailyTaskRepository>((ref) => DailyTaskRepository(ref.read));
