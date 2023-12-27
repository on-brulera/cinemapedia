
import 'package:flutter/material.dart';

class AppTheme{

  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color.fromARGB(0, 73, 73, 248),
    );
  }

}