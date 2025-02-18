part of '../app_imoprts/app_imports.dart';

class ButtonCustom extends StatelessWidget {
  final String? text;
  final double? sizeText;
  final double? width;
  final double? height;
  final Color? color;
  final Color? buttonColor;
  final bool? tr;
  final MaterialType? materialType;
  final Color? iconColor;
  final void Function()? onPressed;
  final IconData? iconData;
  final BorderRadiusGeometry? borderRadius;
  final TextAlign? textAlign;
  final MainAxisAlignment? mainAxisAlignment;
  final FontWeight? fontWeight;
  final double? iconSize;

  const ButtonCustom({
    super.key,
    this.text,
    this.iconSize,
    this.height,
    this.fontWeight,
    this.borderRadius,
    this.mainAxisAlignment,
    this.textAlign,
    this.iconColor,
    this.width,
    this.color,
    this.sizeText,
    this.onPressed,
    this.buttonColor,
    this.materialType,
    this.iconData,
    this.tr = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Material(
            type: materialType ?? MaterialType.button,
            elevation: 2.0,
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(16)),
            color: buttonColor ?? Theme.of(context).primaryColor,
            child: MaterialButton(
                padding: const EdgeInsets.all(0),
                onPressed: onPressed,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment:
                        mainAxisAlignment ?? MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      iconData != null
                          ? Icon(iconData,
                              size: iconSize ?? 15,
                              color: iconColor ?? Colors.black)
                          : const SizedBox(),
                      iconData != null
                          ? const SizedBox(width: 5)
                          : const SizedBox(),
                      TextViewCustom(
                          text: text ?? "",
                          textAlign: textAlign ?? TextAlign.center,
                          color: color ?? Colors.white,
                          size: sizeText,
                          fontWeight: fontWeight ?? FontWeight.bold)
                    ]))));
  }
}
