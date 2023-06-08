import 'package:click_counter/core/constants/ikey.dart';
import 'package:click_counter/model/hive_register.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/theme_data.dart';
import 'view/counter_list.dart';
import 'logic/switch_provider.dart';
import 'model/hive_openbox.dart';
import 'model/run_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  late AppRegisterHive appHive;
  late AppOpenBoxHive appBox;
  appHive = AppRegisterHive(const CounterRegisterFactory());
  appHive.registerHive();

  appBox = AppOpenBoxHive(const CounterOpenBoxFactory());
  await appBox.makeOpenBox();
  await Hive.openBox(IKey.settingKey);
  /* Hive.deleteBoxFromDisk(IKey.counterKey);
  Hive.deleteBoxFromDisk(IKey.settingKey); */
  late MainSetup appFactory;
  appFactory = MainSetup(const AppFactory());
  final app = appFactory.makeApp();
  runApp(app);
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _model = SwitchModel();
  @override
  Widget build(BuildContext context) {
    return SwitchProvider(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Click Counter App',
        theme: kDefaultTheme,
        home: const CounterList(),
      ),
    );
  }
}
