import '../imports/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: const BoxDecoration(
          // color: kPrimaryColor,
          image: DecorationImage(
              image: AssetImage(kbackground), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
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
                child: Icon(Icons.logout),
              ),
            ),
          ],
        ),
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

  Container changableImage(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: size.height * 0.3,
      decoration: const BoxDecoration(
          // color: kPrimaryColor,
          image: DecorationImage(image: AssetImage(kQuestionMark))),
    );
  }

  Row bottomWidget(Size size) {
    return Row(
      children: [
        Expanded(
          child: RoundedButtonWidget(
            size: size,
            onPressed: () {},
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
            onPressed: () {},
            icon: Image.asset(
              kEat,
              width: 90,
            ),
          ),
        ),
      ],
    );
  }
}
