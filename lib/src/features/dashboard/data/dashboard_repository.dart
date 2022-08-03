import 'package:ct_analyst_app/src/features/dashboard/domain/dashboard_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/application/auth_local_service.dart';

abstract class IDashboardRepository {
  Future<void> fetchDashboard();
}

final clientProvider = Provider.family((ref, token) => Dio(BaseOptions(
    baseUrl: "http://${dotenv.env['IP']}/excel/",
    headers: {"authorization": token})));

class DashboardRepository implements IDashboardRepository {
  DashboardRepository(this.read);

  final Reader read;

  DashboardData? _data;

  DashboardData? get dashboardData => _data;

  @override
  Future<DashboardData?> fetchDashboard() async {
    final token = await read(authServiceProvider).getToken();
    final response = await read(clientProvider(token)).get('/getData');

    _data = DashboardData.fromJson(response.data);

    return _data;
  }
}

final dashboardRepositoryProvider =
    Provider((ref) => DashboardRepository(ref.read));

final fetchDashboardData = FutureProvider((ref) {
  final repoProvider = ref.watch(dashboardRepositoryProvider);
  return repoProvider.fetchDashboard();
});
