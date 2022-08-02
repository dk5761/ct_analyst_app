// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DashboardData _$$_DashboardDataFromJson(Map<String, dynamic> json) =>
    _$_DashboardData(
      monthList: (json['monthList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      csat: (json['csat'] as List<dynamic>?)?.map((e) => e as String).toList(),
      communication: (json['communication'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      surveyCount: (json['surveyCount'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      closedCase:
          (json['closedCase'] as List<dynamic>?)?.map((e) => e as int).toList(),
      atrDays: (json['atrDays'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      ownedCases:
          (json['ownedCases'] as List<dynamic>?)?.map((e) => e as int).toList(),
      adherance: (json['adherance'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      timeoutsPhone: (json['timeoutsPhone'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timeoutsChat: (json['timeoutsChat'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lateLogins: (json['lateLogins'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      coverage:
          (json['coverage'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_DashboardDataToJson(_$_DashboardData instance) =>
    <String, dynamic>{
      'monthList': instance.monthList,
      'csat': instance.csat,
      'communication': instance.communication,
      'surveyCount': instance.surveyCount,
      'closedCase': instance.closedCase,
      'atrDays': instance.atrDays,
      'ownedCases': instance.ownedCases,
      'adherance': instance.adherance,
      'timeoutsPhone': instance.timeoutsPhone,
      'timeoutsChat': instance.timeoutsChat,
      'lateLogins': instance.lateLogins,
      'coverage': instance.coverage,
    };
