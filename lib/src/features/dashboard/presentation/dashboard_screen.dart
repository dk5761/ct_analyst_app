import 'package:auto_route/auto_route.dart';
import 'package:ct_analyst_app/src/features/dashboard/data/dashboard_repository.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/widgets/custom_dropdown.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/widgets/name_dropdown_list.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/widgets/table_generator.dart';
import 'package:ct_analyst_app/src/routing/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/custom_button.dart';
import '../../../constants/colors.dart';
import '../../authentication/data/auth_repository.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currUser = ref.read(getCurrentUser);
    final ddata = ref.watch(fetchDashboardData);
    return currUser.when(
        data: (user) {
          final position = user!.user.position;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                            color: darkHeaderTextColor,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (position == 0)
                      CustomButton(
                        label: "Go To Task Screen",
                        onPressed: () => AutoRouter.of(context)
                            .popAndPush(const PositionWrapper()),
                      ),
                    if (position > 0) const AnalystNameDropdown()
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                ddata.when(
                  data: (data) {
                    return Expanded(child: TableGenerator(data: data));
                  },
                  error: (error, _) => Text(error.toString()),
                  loading: () => const SizedBox(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, _) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
