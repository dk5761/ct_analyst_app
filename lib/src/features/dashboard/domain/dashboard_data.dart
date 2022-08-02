// import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
class DashboardData with _$DashboardData {
  factory DashboardData({
    required List<String>? monthList,
    required List<String>? csat,
    required List<String>? communication,
    required List<String>? surveyCount,
    required List<int>? closedCase,
    required List<double>? atrDays,
    required List<int>? ownedCases,
    required List<double>? adherance,
    required List<String>? timeoutsPhone,
    required List<String>? timeoutsChat,
    required List<String>? lateLogins,
    required List<int>? coverage,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, Object?> json) =>
      _$DashboardDataFromJson(json);
}
