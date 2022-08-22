import 'package:ct_analyst_app/src/features/dashboard/domain/dashboard_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/application/auth_local_service.dart';

abstract class IDashboardRepository {
  Future<void> fetchDashboard();
  Future<void> fetchNames();
}

final clientProvider = Provider.family((ref, token) => Dio(BaseOptions(
    baseUrl: "http://${dotenv.env['IP']}/excel/",
    headers: {"authorization": token})));

class DashboardRepository implements IDashboardRepository {
  DashboardRepository(this.read);

  final Reader read;

  DashboardData? _data;
  DashboardData? get dashboardData => _data;

  List<dynamic>? _names;
  List<dynamic>? get names => _names;

  @override
  Future<DashboardData?> fetchDashboard() async {
    final token = await read(authServiceProvider).getToken();
    final response = await read(clientProvider(token)).get('/getData');

    _data = DashboardData.fromJson(response.data);

    return _data;
  }

  @override
  Future<void> fetchNames() async {
    final token = await read(authServiceProvider).getToken();
    final response = await read(clientProvider(token)).get('/analystNames');

    _names = response.data["names"];
  }
}

final dashboardRepositoryProvider =
    Provider((ref) => DashboardRepository(ref.read));

final fetchDashboardData = FutureProvider((ref) {
  final repoProvider = ref.watch(dashboardRepositoryProvider);
  return repoProvider.fetchDashboard();
});

final fetchAnalystNames = FutureProvider((ref) {
  final repoProvider = ref.watch(dashboardRepositoryProvider);
  return repoProvider.fetchNames();
});
