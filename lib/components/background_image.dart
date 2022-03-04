import '../imports/imports.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              width: size.height * 0.25,
              top: 0,
              left: 0,
              child: Image.asset(kMainTop)),
          Positioned(
            height: size.height * 0.25,
            bottom: 0,
            left: 0,
            child: Image.asset(kMainBottom),
          ),
          child
        ],
      ),
    );
  }
}
