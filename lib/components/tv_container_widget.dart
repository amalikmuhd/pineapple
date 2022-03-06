import '../imports/imports.dart';

class TVContainer extends StatelessWidget {
  final Widget child;

  const TVContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(kTv)),
      ),
      child: child,
    );
  }
}
