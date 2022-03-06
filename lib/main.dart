import 'package:pineapple/imports/imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(_AppState());
}

class _AppState extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // ignore: avoid_print
            // print("you have an error ${snapshot.error.toString()}");
            return const Text("Something weng wrong");
          } else if (snapshot.hasData) {
            return const WelcomeScreen();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
