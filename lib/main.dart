import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_neo_bank_app/app/constants/app_colors.dart';
import 'package:flutter_neo_bank_app/app/pages/main_page.dart';
import 'package:flutter_neo_bank_app/app/pages/sign_in_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.manrope().fontFamily,
        scaffoldBackgroundColor: AppColors.primary,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignInPage(),
        '/main': (context) => const MainPage(),
      },
    );
  }
}
