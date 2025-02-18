part of '../app_imoprts/app_imports.dart';

class EmptyWidget extends StatelessWidget {
  final String? text;
  const EmptyWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              height: MediaQuery.sizeOf(context).height / 3,
              child: Lottie.asset("assets/lottie/empty.json")),
          TextViewCustom(
              text: text ?? "NO DATA FOUND",
              color: Colors.red,
              size: 18,
              fontWeight: FontWeight.bold)
        ]));
  }
}
