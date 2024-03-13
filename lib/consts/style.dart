import 'package:flutter/material.dart';

class Style {
  static ThemeData style(bool isDark, BuildContext context){
    return ThemeData(
      scaffoldBackgroundColor: isDark? Colors.black : Colors.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: isDark? Colors.black : Colors.white,
        titleTextStyle: TextStyle(
          color: isDark? Colors.white : Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        )
      ),
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: isDark? const Color.fromARGB(255, 16, 16, 16) : const Color.fromARGB(255, 240, 240, 240),
        brightness: isDark? Brightness.dark : Brightness.light,
      ),
      cardColor: isDark? Colors.black : Colors.white,
      canvasColor: isDark? Colors.black : Colors.white,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDark? const ColorScheme.dark() : const ColorScheme.light(),
      ),
      textTheme: isDark?ThemeData.dark().textTheme
      : ThemeData.light().textTheme,
      iconTheme: IconThemeData(
        color: isDark? Colors.white : Colors.black,
      ),
      
    );
  }
}