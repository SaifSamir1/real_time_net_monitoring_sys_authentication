



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routing/app_router.dart';

class MyWebApp extends StatelessWidget {
  const MyWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.cairoTextTheme(
            Theme.of(context).textTheme.apply(
              fontFamily: GoogleFonts.cairo().fontFamily,
            ),
          ),
          primarySwatch: Colors.red,
        ),
    );
  }
}