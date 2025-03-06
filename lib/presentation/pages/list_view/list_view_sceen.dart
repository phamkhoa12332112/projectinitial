import 'package:flutter/material.dart';
import 'package:projectinitial/utils/resources/sizes_manager.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> items = List.generate(20, (index) => 'Item $index');
  final ScrollController _nestedScrollController = ScrollController();
  final ScrollController _listScrollController = ScrollController();

  @override
  void dispose() {
    _nestedScrollController.dispose();
    _listScrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshList() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      items.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView Examples")),
      // Dùng NestedScrollView để có thể scroll ListView và SliverAppBar
      body: NestedScrollView(
        controller: _nestedScrollController,
        // NestedScrollView dùng controller riêng
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              expandedHeight: 200,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Nested ScrollView"),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          onRefresh: _refreshList,
          child: ListView(
            // Dùng PrimaryScrollController thay vì _nestedScrollController
            primary: true,
            children: [
              _buildTitle("ListView"),
              SizedBox(
                height: 200,
                child: ListView(
                  controller: _listScrollController,
                  // ListView con có controller riêng
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10, (index) {
                    return _buildItem("Horizontal $index");
                  }),
                ),
              ),
              _buildTitle("ListView.builder"),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return _buildItem("Builder $index");
                  },
                ),
              ),
              _buildTitle("ListView.separated"),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // Tránh conflict scroll
                itemCount: items.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(title: Text(items[index]));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _nestedScrollController.animateTo(
            0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          );
        },
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(PaddingManager.all16),
      child: Text(title,
          style: const TextStyle(
              fontSize: TextSizes.large, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildItem(String text) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 150,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(RadiusManager.circular10)),
      child: Center(
          child: Text(text, style: const TextStyle(color: Colors.white))),
    );
  }
}
