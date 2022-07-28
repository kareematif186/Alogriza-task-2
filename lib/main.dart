import 'package:alogoriza_task/db/db_helper.dart';
import 'package:alogoriza_task/services/notification_services.dart';
import 'package:alogoriza_task/services/theme_services.dart';
import 'package:alogoriza_task/ui/pages/board.dart';
import 'package:alogoriza_task/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'ui/pages/home_page.dart';

void main()async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor:
    Colors.white,
    //darkGreyClr, // navigation bar color
    statusBarColor:
    Colors.white,
    //darkGreyClr, // status bar color
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
  //
  // NotifyHelper().intializationNotification();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme:Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const Board(),
      //NotificationScreen(payload: 'ssssssss|ssssssss',),
    );
  }
}
