import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teksen_mobile/app/services/shared_config.dart';
import 'package:teksen_mobile/app/app.dart';
import 'app/services/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    return runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => new ThemeNotifier(),
      child: MainApp(),
    ));
  });
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        theme: theme.getTheme(),
        title: 'tek sendikası',
        home: TeksenApp(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
