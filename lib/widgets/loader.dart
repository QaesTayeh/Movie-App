part of '../app_imoprts/app_imports.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: CupertinoActivityIndicator(color: AppColors.primary)));
  }
}
