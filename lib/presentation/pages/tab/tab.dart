import 'package:flutter/material.dart';
import 'package:projectinitial/utils/resources/sizes_manager.dart';
import '../../../utils/resources/constant.dart';
import 'data_provider.dart';
import 'list_tab.dart';
import '../../../utils/resources/gaps_manager.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController textController = TextEditingController();
  TextEditingController tabIndexController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = DataProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Tab Screen")),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.all16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Text",
                filled: true,
                fillColor: Colors.grey[200],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GapsManager.h20,
            TextField(
              keyboardType: TextInputType.number,
              controller: tabIndexController,
              decoration: InputDecoration(
                hintText: "Tab index",
                filled: true,
                fillColor: Colors.grey[200],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GapsManager.h20,
            _buildButton(Constant.addButton, () {
              if (textController.text.isNotEmpty &&
                  tabIndexController.text.isNotEmpty) {
                setState(() {
                  provider?.addData(
                      textController.text, tabIndexController.text);
                });
                textController.clear();
                tabIndexController.clear();
              }
            }),
            GapsManager.h50,
            _buildButton(Constant.nextButton, () {
              int nextIndex = (_tabController.index + 1) % 3;
              _tabController.animateTo(nextIndex);
            }),
            GapsManager.h20,
            _buildButton(Constant.clearButton, () {
              setState(() {
                provider?.clearData();
              });
            }),
            Expanded(
              child: ListTab(tabController: _tabController),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
