import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:parolla_game_mvvm/core/constants/app/app_constants.dart';
import 'package:parolla_game_mvvm/core/init/notifier/application_provider.dart';
import 'package:parolla_game_mvvm/view/authenticate/login/view/login_view.dart';
import 'package:provider/provider.dart';

import 'core/init/lang/language_manager.dart';

Future<void> main(List<String> args) async {
  await _init();

  runApp(MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
          supportedLocales: LanguageManager.instance.supportedLocales,
          path: ApplicationConstants.LANG_ASSET_PATH,
          startLocale: LanguageManager.instance.enLocale,
          child: MyApp())));
}

Future<void> _init() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: LoginView(),
    );
  }
}
