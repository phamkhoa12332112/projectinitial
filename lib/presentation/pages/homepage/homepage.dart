import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:projectinitial/utils/resources/gaps_manager.dart';
import 'package:projectinitial/utils/resources/locale_text.dart';
import 'package:projectinitial/utils/resources/sizes_manager.dart';

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
            const Text(
              LocaleText.welcome,
              style: TextStyle(fontSize: TextSizes.extraLarge),
            ).tr(),
            GapsManager.h20,
            SizedBox(
              width: SizesManager.w200,
              child: ElevatedButton(
                onPressed: () {
                  // Chuyển đổi ngôn ngữ: nếu đang dùng tiếng Anh thì đổi sang tiếng Việt và ngược lại
                  if (context.locale.languageCode == 'en') {
                    context.setLocale(const Locale('vi', 'VN'));
                  } else {
                    context.setLocale(const Locale('en', 'US'));
                  }
                },
                child: const Text(LocaleText.changeLanguage).tr(),
              ),
            ),
            GapsManager.h20,
            // Hiển thị hình ảnh từ assets
            Image.asset(ImagePaths.sampleImage),
          ],
        ),
      ),
    );
  }
}
