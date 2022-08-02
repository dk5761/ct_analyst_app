import 'package:ct_analyst_app/src/features/authentication/application/auth_local_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/task.dart';
import 'package:dio/dio.dart';

abstract class IDailyTaskRepository {
  //fetch the daily tasks.
  Future<List<Task>> fetchDailyTask();
}

final clientProvider = Provider.family((ref, token) => Dio(BaseOptions(
    baseUrl: "http://${dotenv.env['IP']}/dtask/",
    headers: {"authorization": token})));

class DailyTaskRepository implements IDailyTaskRepository {
  final Reader read;

  const DailyTaskRepository(this.read);

  @override
  Future<List<Task>> fetchDailyTask() async {
    final token = await read(authServiceProvider).getToken();
    final response = await read(clientProvider(token)).get('/getAllTask');

    return List<Task>.from(response.data.map((x) => Task.fromJson(x)));
  }
}

final dailyTaskRepositoryProvider =
    Provider<DailyTaskRepository>((ref) => DailyTaskRepository(ref.read));

final fetchDailyTaskProvider = FutureProvider<List<Task>>((ref) async {
  final dailyTaskRepository = ref.watch(dailyTaskRepositoryProvider);

  return dailyTaskRepository.fetchDailyTask();
});
