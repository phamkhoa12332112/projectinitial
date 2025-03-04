import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/resources/assets_manager.dart';

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;

  const HomePage({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projet Initial'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: toggleTheme,
            tooltip: "Toggle Theme",
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('welcome', style: TextStyle(fontSize: 25),).tr(),
            const SizedBox(height: 20),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Chuyển đổi ngôn ngữ: nếu đang dùng tiếng Anh thì đổi sang tiếng Việt và ngược lại
                  if (context.locale.languageCode == 'en') {
                    context.setLocale(const Locale('vi', 'VN'));
                  } else {
                    context.setLocale(const Locale('en', 'US'));
                  }
                },
                child: Text('change_language').tr(),
              ),
            ),
            const SizedBox(height: 20),
            // Hiển thị hình ảnh từ assets
            Image.asset(ImagePaths.sampleImage),
          ],
        ),
      ),
    );
  }
}
