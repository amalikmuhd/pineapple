import '../imports/imports.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool loadingSet = false;
  Container loading = Container(
      color: Colors.white,
      child: const Center(
          child: SpinKitRipple(
        color: Colors.red,
        size: 50.0,
      )));
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loadingSet
        ? loading
        : Scaffold(
            body: BackgroundWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Text(
                    "Welcome To Fruit Eater",
                    style: TextStyle(
                        fontFamily: 'River', fontSize: 34, color: Colors.white),
                  ),
                  const Spacer(),
                  ButtonWidget(
                    size: size,
                    onPressed: () async {
                      //Start loading before we login in user anonymously
                      setState(() => loadingSet = true);

                      AuthServices.loginAnonmyous(onPress: () {
                        //stop loading
                        setState(() => loadingSet = false);

                        print("loading");
                        //push 0 to firestore to reset the fruits
                        DatabaseServices.updateFruits(number: '0');

                        //navigate to home screen
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const HomeScreen()));
                      });
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
  }
}



    //  try {
    //                     UserCredential _cred =
    //                         await FirebaseAuth.instance.signInAnonymously();
    //                     User? _user = _cred.user;

    //                     if (_user == null) {
    //                       // ignore: avoid_print
    //                       print("There is a problem signing");
    //                       setState(() => loadingSet = false);
    //                     } else {
    //                       setState(() => loadingSet = false);
    //                       //push 0 to firestore to reset the fruits
    //                       DatabaseServices.updateFruits(number: '0');
    //                       Navigator.pushReplacement(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (builder) => const HomeScreen()));
    //                     }
    //                     // ignore: avoid_print
    //                     print(_user?.uid);
    //                   } catch (e) {
    //                     // ignore: avoid_print
    //                     print(e.toString());
    //                   }