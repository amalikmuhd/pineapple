import '../imports/imports.dart';

class ButtonWidget extends StatelessWidget {
//set default name and color of the button

  const ButtonWidget({
    Key? key,
    required this.size,
    this.text = "Login Anonymous",
    this.color = kPrimaryColor,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String text;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
              primary: color,
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
