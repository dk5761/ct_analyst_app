//drop downlist widget for analyst names.
import 'package:ct_analyst_app/src/features/dashboard/data/dashboard_repository.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalystNameDropdown extends ConsumerWidget {
  const AnalystNameDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(fetchAnalystNames);
    String? positionValue;

    return names.when(
        data: (data) {
          final namesList = ref.read(dashboardRepositoryProvider).names;
          return CustomDropDown(value: positionValue, names: namesList);
        },
        error: (error, _) {
          return Text(error.toString());
        },
        loading: () => const CircularProgressIndicator());
  }
}
