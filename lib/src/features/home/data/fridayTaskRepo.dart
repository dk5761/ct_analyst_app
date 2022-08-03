import 'package:ct_analyst_app/src/features/home/domain/friday_task.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../authentication/application/auth_local_service.dart';

abstract class IFetchFridayTaskRepository {
  //fetch the daily tasks.
  Future<FridayTask> fetchFridayTask();
}

final clientProvider = Provider.family((ref, token) => Dio(BaseOptions(
    baseUrl: "http://${dotenv.env['IP']}/ftask/",
    headers: {"authorization": token})));

class FetchFridayTaskRepository implements IFetchFridayTaskRepository {
  final Reader read;

  const FetchFridayTaskRepository(this.read);

  @override
  Future<FridayTask> fetchFridayTask() async {
    final token = await read(authServiceProvider).getToken();
    final response = await read(clientProvider(token)).get('/getFTask');

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
