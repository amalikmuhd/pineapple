import '../imports/imports.dart';

class RoundedButtonWidget extends StatelessWidget {
//set default name and color of the button

  const RoundedButtonWidget({
    Key? key,
    required this.size,
    required this.icon,
    this.color = kPrimaryColor,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final Image icon;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.7,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            primary: color,
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: onPressed,
          child: icon),
    );
  }
}
