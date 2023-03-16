import 'package:parolla_game_mvvm/core/init/theme/light/color_scheme_light.dart';
import 'package:parolla_game_mvvm/core/init/theme/light/text_theme_light.dart';

abstract class ILightTheme{
  TextThemeLight? textThemeLight = TextThemeLight.instance;
  
  ColorSchemaLight? colorSchemaLight = ColorSchemaLight.instance;
}