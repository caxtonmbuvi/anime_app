import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../exports.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  

  // void toggleTheme() async{
  //   if (state is ThemeLight) {
  //     emit(ThemeDark(darkTheme));
  //   } else {
  //     emit(ThemeLight());
  //   }
  // }

  Future<void> loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    if (isDarkMode) {
      emit(ThemeDark(darkTheme));
    } else {
      emit(ThemeLight());
    }
  }

  void toggleTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (state is ThemeLight) {
      emit(ThemeDark(darkTheme));
      await prefs.setBool('isDarkMode', true);
    } else {
      emit(ThemeLight());
      await prefs.setBool('isDarkMode', false);
    }
  }
}


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple, // Use your own color
  hintColor: Colors.amber, // Use your own color
  // Define other properties like appBarTheme, buttonTheme, etc. as needed
  appBarTheme: AppBarTheme(
    color: Colors.deepPurple, // Custom color for the AppBar
    // Other properties
  ),
  // You can also customize text themes, icon themes, etc.
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.white), // Custom text style
    // Other text styles
  ),
  // ... any other theme customizations
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  iconTheme: IconThemeData(color: Colors.blue), // Custom icon color for light theme
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.black), // Custom text color for light theme
    // Define other text styles as needed
  ),
  // Other ThemeData properties...
);
