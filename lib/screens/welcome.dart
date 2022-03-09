import '../imports/imports.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? const Loading()
        : Scaffold(
            body: BackgroundWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "Welcome To Fruit Eater",
                    style: kFontTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  ButtonWidget(
                    size: size,
                    onPressed: () async {
                      //When button is press start loading before we login in user anonymously
                      setState(() => isLoading = true);

                      AuthServices.loginAnonmyous(onSuccess: () {
                        //stop loading
                        setState(() => isLoading = false);

                        //push 0 to firestore to reset the fruits
                        DatabaseServices.updateFruits(number: '0');

                        //navigate to home screen
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const HomeScreen()));
                      }, onError: (e) {
                        Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Something went wrong",
                            desc: e,
                            buttons: [
                              DialogButton(
                                  color: Colors.transparent,
                                  child: const Text("Try Again"),
                                  onPressed: () => Navigator.pop(context))
                            ]).show();

                        setState(() => isLoading = false);
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
