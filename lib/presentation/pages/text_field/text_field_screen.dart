import 'package:flutter/material.dart';
import 'package:projectinitial/utils/resources/gaps_manager.dart';
import 'package:projectinitial/utils/resources/sizes_manager.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  late TextEditingController _textController;
  // Sử dụng late giúp trì hoãn khởi tạo controller cho đến khi initState() chạy

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(); // Khởi tạo controller, tránh tạo lại mỗi lần build
  }

  @override
  void dispose() {
    _textController.dispose(); // Giải phóng bộ nhớ
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test TextField")),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.all16),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: "Enter text",
                border: OutlineInputBorder(),
              ),
            ),
            GapsManager.h20,
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("You entered: ${_textController.text}")),
                );
              },
              child: const Text("Show Text"),
            ),
          ],
        ),
      ),
    );
  }
}
