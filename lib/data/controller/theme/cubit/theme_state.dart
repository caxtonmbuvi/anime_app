part of 'theme_cubit.dart';

// theme_state.dart
enum AppTheme { light, dark }

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

class ThemeLight extends ThemeState {}

class ThemeDark extends ThemeState {
  final ThemeData darkTheme;
  ThemeDark(this.darkTheme);
}
