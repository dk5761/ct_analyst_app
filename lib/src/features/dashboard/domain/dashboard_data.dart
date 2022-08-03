// import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
class DashboardData with _$DashboardData {
  factory DashboardData({
    required List<dynamic>? monthList,
    required List<dynamic>? csat,
    required List<dynamic>? communication,
    required List<dynamic>? surveyCount,
    required List<dynamic>? closedCase,
    required List<dynamic>? atrDays,
    required List<dynamic>? ownedCases,
    required List<dynamic>? adherance,
    required List<dynamic>? timeoutsPhone,
    required List<dynamic>? timeoutsChat,
    required List<dynamic>? lateLogins,
    required List<dynamic>? coverage,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, Object?> json) =>
      _$DashboardDataFromJson(json);
}
