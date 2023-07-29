import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entities/cadastro_entity.dart';

class CadastroService {
  final _key = 'KEY_CADASTRO';

  Future<void> salvar(List<CadastroEntity> itens) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(itens);
    await prefs.setString(_key, listJson);
  }

  Future<List<CadastroEntity>> buscar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listJson = prefs.getString(_key);
    if (listJson != null) {
      return CadastroEntity.fromJsonList(jsonDecode(listJson));
    }
    return [];
  }
}
