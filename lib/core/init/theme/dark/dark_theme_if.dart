import 'package:parolla_game_mvvm/core/init/theme/Dark/color_scheme_Dark.dart';
import 'package:parolla_game_mvvm/core/init/theme/Dark/text_theme_Dark.dart';

abstract class IDarkTheme{
  TextThemeDark? textThemeDark =TextThemeDark.instance;
  DarkColorScheme? darkColorScheme = DarkColorScheme.instance;
}