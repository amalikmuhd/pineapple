import '../imports/imports.dart';

class AppBarWidget extends StatefulWidget {
  final Function() onPressed;
  const AppBarWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: kPrimaryColor,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      actions: [
        InkWell(
          onTap: widget.onPressed,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.logout,
              color: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}
