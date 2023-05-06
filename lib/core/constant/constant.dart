import 'package:flutter/material.dart';



const DEFAULT_ERROR_MSG = 'Something went wrong, try again later';

typedef Json = Map<String, dynamic>;
Map<int, Color> color = {
  50: const Color.fromRGBO(224, 187, 97, .1),
  100: const Color.fromRGBO(224, 187, 97, .2),
  200: const Color.fromRGBO(224, 187, 97, .3),
  300: const Color.fromRGBO(224, 187, 97, .4),
  400: const Color.fromRGBO(224, 187, 97, .5),
  500: const Color.fromRGBO(224, 187, 97, .6),
  600: const Color.fromRGBO(224, 187, 97, .7),
  700: const Color.fromRGBO(224, 187, 97, .8),
  800: const Color.fromRGBO(224, 187, 97, .9),
  900: const Color.fromRGBO(224, 187, 97, 1),
};

MaterialColor kColorCustom = MaterialColor(0xFFD4A048, color);