
import 'exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit(),
            ),
            BlocProvider<ItemCubit>(
              create: (context) => ItemCubit(ItemRepository()),
            ),
            BlocProvider<LikeCubit>(
              create: (context) => LikeCubit(),
            ),
          ],
          child:
              BlocBuilder<ThemeCubit, ThemeState>(builder: ((context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state is ThemeDark ? ThemeData.dark() : ThemeData.light(),
              initialRoute: Routes.home,
              routes: appRoutes,
              // home: const HomeScreen(),
            );
          })),
        );
      },
    );
  }
}
