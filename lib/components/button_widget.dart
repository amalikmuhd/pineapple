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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/button_background_image.png"))),
      width: size.width * 0.7,
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
          child: Text(
            text,
            style: const TextStyle(fontFamily: 'River', fontSize: 22),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              padding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 40)),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
