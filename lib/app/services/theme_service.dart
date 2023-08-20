import 'package:injectable/injectable.dart';
import 'package:stacked_themes/stacked_themes.dart';

@lazySingleton
class ThemeServices {
  final themeService = ThemeService.getInstance();
}
