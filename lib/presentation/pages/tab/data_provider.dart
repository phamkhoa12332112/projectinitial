import 'package:flutter/material.dart';

class DataProvider extends InheritedWidget {
  final List<String> listActivities;
  final List<String> listHistory;
  final List<String> listSettings;

  final Function(String, String) addData;
  final Function() clearData;

  const DataProvider({
    super.key,
    required this.listActivities,
    required this.listHistory,
    required this.listSettings,
    required this.addData,
    required this.clearData,
    required super.child,
  });

  static DataProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataProvider>();
  }

  @override
  bool updateShouldNotify(DataProvider oldWidget) {
    return oldWidget.listActivities != listActivities ||
        oldWidget.listHistory != listHistory ||
        oldWidget.listSettings != listSettings;
  }
}
