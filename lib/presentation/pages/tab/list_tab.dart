import 'package:flutter/material.dart';
import 'package:projectinitial/utils/resources/constant.dart';
import 'package:projectinitial/utils/resources/sizes_manager.dart';
import 'data_provider.dart';

class ListTab extends StatefulWidget {
  final TabController tabController;

  const ListTab({super.key, required this.tabController});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  @override
  Widget build(BuildContext context) {
    final provider = DataProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: widget.tabController,
          tabs: const [
            Tab(text: TabTitle.activities),
            Tab(text: TabTitle.history),
            Tab(text: TabTitle.settings),
          ],
        ),
      ),
      body: TabBarView(
        controller: widget.tabController,
        children: [
          _buildDataList(provider?.listActivities ?? []),
          _buildDataList(provider?.listHistory ?? []),
          _buildDataList(provider?.listSettings ?? []),
        ],
      ),
    );
  }

  Widget _buildDataList(List<String> dataList) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingManager.all4),
          child: Text(dataList[index],
              style: const TextStyle(fontSize: TextSizes.large)),
        );
      },
    );
  }
}
