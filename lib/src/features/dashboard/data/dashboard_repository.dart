import 'package:ct_analyst_app/src/features/dashboard/domain/dashboard_data.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/widgets/custom_dropdown.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/application/auth_local_service.dart';

abstract class IDashboardRepository {
  Future<void> fetchDashboard(String name);
  Future<void> fetchNames();
}

final clientProvider = Provider.family((ref, token) => Dio(BaseOptions(
    baseUrl: "http://${dotenv.env['IP']}/excel/",
    headers: {"authorization": token})));

class DashboardRepository implements IDashboardRepository {
  DashboardRepository(this.read);

  final Reader read;

  @override
  Future<DashboardData?> fetchDashboard(name) async {
    final token = await read(authServiceProvider).getToken();

    final response = await read(clientProvider(token))
        .get('/getData', queryParameters: {"name": name});

    if (response.data == null) {
      return null;
    }

    return DashboardData.fromJson(response.data);
  }

  @override
  Future<List<dynamic>> fetchNames() async {
    final token = await read(authServiceProvider).getToken();
    final response = await read(clientProvider(token)).get('/analystNames');

    return response.data["names"];
  }
}

final dashboardRepositoryProvider =
    Provider((ref) => DashboardRepository(ref.read));

// final fetchDashboardData =
//     FutureProvider.family<DashboardData?, String>((ref, name) async {
//   final repoProvider = ref.watch(dashboardRepositoryProvider);
//   print("name $name ");
//   return repoProvider.fetchDashboard(name);
// });

final fetchDashboardData = FutureProvider<DashboardData?>((ref) {
  final repoProvider = ref.watch(dashboardRepositoryProvider);
  final name = ref.read(dropItemProvider);
  return repoProvider.fetchDashboard(name);
});

final fetchAnalystNames = FutureProvider((ref) {
  final repoProvider = ref.watch(dashboardRepositoryProvider);
  return repoProvider.fetchNames();
});
