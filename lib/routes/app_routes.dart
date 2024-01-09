import '../exports.dart';


final Map<String, WidgetBuilder> appRoutes = {
  Routes.home: (context) => const HomeScreen(),
  Routes.charInfo: (context) => CharacterDetailScreen(),
  // Add other route mappings here
};