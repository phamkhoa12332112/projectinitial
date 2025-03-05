import 'package:flutter/material.dart';
import 'package:projectinitial/presentation/pages/tab/tab.dart';
import 'data_provider.dart';

class DataProviderWrapper extends StatefulWidget {
  const DataProviderWrapper({super.key});

  @override
  State<DataProviderWrapper> createState() => _DataProviderWrapperState();
}

class _DataProviderWrapperState extends State<DataProviderWrapper> {
  List<String> listActivities = [];
  List<String> listHistory = [];
  List<String> listSettings = [];

  void addData(String data, String index) {
    setState(() {
      switch (index) {
        case '1':
          listActivities.add(data);
          break;
        case '2':
          listHistory.add(data);
          break;
        case '3':
          listSettings.add(data);
          break;
      }
    });
  }

  void clearData() {
    setState(() {
      listActivities.clear();
      listHistory.clear();
      listSettings.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataProvider(
      listActivities: listActivities,
      listHistory: listHistory,
      listSettings: listSettings,
      addData: addData,
      clearData: clearData,
      child: const TabScreen(),
    );
  }
}