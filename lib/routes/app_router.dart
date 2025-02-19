part of '../app_imoprts/app_imports.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.splashRoute:
        return MaterialPageRoute(
          builder: (_) {
            return SplashScreen();
          },
        );
      case AppStrings.dashboardRoute:
        return MaterialPageRoute(builder: (_) => const Dashboard());

      case AppStrings.details:
        Map? argument = settings.arguments as Map?;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(movieId: argument?['movieId']),
        );
    }
    return null;
  }
}
