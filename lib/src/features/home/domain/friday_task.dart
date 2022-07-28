import 'dart:convert';

class FridayTask {
  FridayTask({
    required this.recording,
    required this.presentation,
    required this.agedCases,
  });

  final String recording;
  final String presentation;
  final String agedCases;

  factory FridayTask.fromJson(Map<String, dynamic> json) => FridayTask(
        recording: json["recording"],
        presentation: json["presentation"],
        agedCases: json["agedCases"],
      );

  Map<String, dynamic> toJson() => {
        "recording": recording,
        "presentation": presentation,
        "agedCases": agedCases,
      };
}

class SeperateFridayModel {
  final String url;
  final String title;

  SeperateFridayModel({required this.url, required this.title});
}

List<SeperateFridayModel> fridaySeperatorFunction(FridayTask model) {
  final recording =
      SeperateFridayModel(url: model.recording, title: 'Recording');
  final presentation =
      SeperateFridayModel(url: model.presentation, title: 'Presentation');
  final agedCases =
      SeperateFridayModel(url: model.agedCases, title: 'Aged Cases');

  List<SeperateFridayModel> list = [];

  // check if anything is empty
  if (agedCases.url != "") {
    list.add(agedCases);
  }
  if (presentation.url != "") {
    list.add(presentation);
  }
  if (recording.url != "") {
    list.add(recording);
  }

  return list;
}
