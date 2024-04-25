import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naybeyes/main%20screens/role_selection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const RoleSelectionPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //    image: AssetImage('lib/assets/watercolor-paper-texture.jpg'), // Replace with your image path
            //    fit: BoxFit.cover, // Adjust the fit as needed (cover, contain, etc.)
            //   ),
            // ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image widget at the center
            Image.asset(
              'lib/assets/logo_varients/fulllogo-green.png', 
              width: 200, // Adjust the width of the image as needed
              height: 200, // Adjust the height of the image as needed
            ),
          ],
        ),
      ),
    ),
  );
}

}
