part of './app_imoprts/app_imports.dart';

class MovieDemo extends StatelessWidget {
  const MovieDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return MaterialApp(
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme(context),
        color: AppColors.primary,
        title: AppStrings.appTitle,
        navigatorKey: globalKey,
        onGenerateRoute: appRouter.generateRoute);
  }
}
