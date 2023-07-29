import 'package:flutter/material.dart';

import 'pages/cadastro/cadastro_page.dart';
import 'pages/home/home_page.dart';

class AppRouters {
  static String initialRouter = '/';
  static String cadastro = '/cadastro';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRouter: (context) => const HomePage(),
      cadastro: (context) => const CadastroPage(),
    };
  }
}
