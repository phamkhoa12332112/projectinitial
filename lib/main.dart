import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:projectinitial/presentation/pages/list_view/list_view_sceen.dart';
import 'package:projectinitial/presentation/pages/text_field/text_field_screen.dart';
import 'package:projectinitial/utils/theme/theme.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  runApp(
    const MyApp(),
    // EasyLocalization(
    //   supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
    //   path: 'assets/locales',
    //   fallbackLocale: const Locale('en', 'US'),
    //   child: const MyApp(),
    // ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Initial',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: _themeMode,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      home: ListViewScreen(),
    );
  }
}