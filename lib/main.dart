import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lit/constants/strings.dart';
import 'package:lit/data/provider/location_provider.dart';
import 'package:lit/presentation/pages/booking_status.dart';
import 'package:lit/presentation/pages/home.dart';
import 'package:lit/presentation/pages/login.dart';
import 'package:lit/presentation/pages/map.dart';
import 'package:lit/presentation/pages/restaurants.dart';
import 'package:lit/presentation/pages/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lit/presentation/pages/selections.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lit/presentation/pages/home.dart';
import 'package:lit/constants/locator.dart';
import 'package:lit/route.dart';

void main() async {
  await setupLocator();
  runApp(ChangeNotifierProvider(
      create: (context) => LocationProvider(),
      child: LitApp(router: AppRouter())));
}

class LitApp extends StatelessWidget {
  final AppRouter router;
  const LitApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRoute,
      initialRoute: AUTH,
      title: "Lit",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
    );
  }
}
