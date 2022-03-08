import '../imports/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int generateImageNumber = 1;

  // CollectionReference users = FirebaseFirestore.instance.collection('fruit');

  // Future<void> addUser() {
  //   // Call the user's CollectionReference to add a new user
  //   return users
  //       .add({
  //         'full_name': "fullName", // John Doe
  //       })
  //       // ignore: avoid_print
  //       // ignore: avoid_print
  //       .then((value) => print("User Added"))
  //       // ignore: avoid_print
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundWidget(
      imagePath: kbackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              changableImage(size),
              const Spacer(),
              bottomWidget(size),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      foregroundColor: kPrimaryColor,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      actions: [
        InkWell(
          onTap: () async {
            try {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const WelcomeScreen()));
              // ignore: empty_catches
            } catch (e) {}
          },
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

  TVContainer changableImage(Size size) {
    return TVContainer(
        child: Align(
      alignment: Alignment.centerLeft / 5,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width * 0.35,
        child: Image.asset(
          "assets/images/fruit" "$generateImageNumber" ".png",
          fit: BoxFit.fitWidth,
        ),
      ),
    ));
  }

  Row bottomWidget(Size size) {
    return Row(
      children: [
        Expanded(
          child: RoundedButtonWidget(
            size: size,
            onPressed: () {
              setState(() {
                int random = Random().nextInt(8) + 1;
                generateImageNumber = random;
                // addUser();
              });
            },
            icon: Image.asset(
              kFruit,
              width: 90,
            ),
          ),
        ),
        Expanded(
          child: RoundedButtonWidget(
            size: size,
            color: Colors.green,
            onPressed: () {
              setState(() {
                generateImageNumber = 0;
              });
            },
            icon: Image.asset(
              kEat,
              width: 90,
            ),
          ),
        ),
      ],
    );
  }

  int generateRandomNumber() {
    return 1;
  }
}
