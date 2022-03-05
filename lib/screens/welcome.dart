import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../imports/imports.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Container loading = Container(
      color: Colors.white,
      child: const Center(
          child: SpinKitRipple(
        color: Colors.red,
        size: 50.0,
      )));
  bool loadingSet = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loadingSet
        ? loading
        : Scaffold(
            body: BackgroundWidget(
              size: size,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Text("Welcome Fruit Eater"),
                  const Spacer(),
                  ButtonWidget(
                    size: size,
                    onPressed: () async {
                      setState(() => loadingSet = true);

                      try {
                        UserCredential _cred =
                            await FirebaseAuth.instance.signInAnonymously();
                        User? _user = _cred.user;

                        if (_user == null) {
                          // ignore: avoid_print
                          print("There is a problem signing in");
                          setState(() => loadingSet = false);
                        } else {
                          setState(() => loadingSet = false);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => const HomeScreen()));
                        }
                        // ignore: avoid_print
                        print(_user?.uid);
                      } catch (e) {
                        // ignore: avoid_print
                        print(e.toString());
                      }
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
  }
}
