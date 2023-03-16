import 'package:parolla_game_mvvm/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class ApplicationProvider {
  static final ApplicationProvider _instance = ApplicationProvider._init();

  static ApplicationProvider get instance => _instance;
  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context)=>ThemeNotifier())
  ];
  List<SingleChildWidget> uiChangesItems = [];


}