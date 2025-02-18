part of '../../app_imoprts/app_imports.dart';

class AppColors {
  static Color colorFromHex(String hexColor, [String opcity = 'FF']) {
    final String color = hexColor.replaceAll('#', '');
    return Color(int.parse(opcity + color, radix: 16));
  }

  static final Color primary = colorFromHex('#7B1111');
  static final Color secondary = colorFromHex('#BABABA');
  static final Color backgroundColor = colorFromHex('#CCCAC9');
}
