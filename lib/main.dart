import 'package:pineapple/imports/imports.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: WelcomeScreen()));
}

// class _AppState extends StatelessWidget {
//   final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FutureBuilder(
//         future: _fbApp,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Text("Something weng wrong");
//           } else if (snapshot.hasData) {
//             return const WelcomeScreen();
//           } else {
//             return const CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
