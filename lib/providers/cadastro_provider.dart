import 'package:flutter/material.dart';

import '../entities/cadastro_entity.dart';
import '../services/cadastro_service.dart';

class CadastroProvider with ChangeNotifier {
  final service = CadastroService();
  List<CadastroEntity> _listaProdutos = [];
  CadastroEntity? _selecionado;

  CadastroProvider() {
    buscar();
  }

  buscar() async {
    listaProdutos = await service.buscar();
  }

  List<CadastroEntity> get listaProdutos => _listaProdutos;

  CadastroEntity? get selecionado {
    return _selecionado;
  }

  set selecionado(CadastroEntity? val) {
    _selecionado = val;
    notifyListeners();
  }

  set idx(int val) {
    notifyListeners();
  }

  void atualizarItem(int idx) {
    if (selecionado != null) {
      _listaProdutos[idx] = _selecionado!;
      notifyListeners();
    }
  }

  set listaProdutos(List<CadastroEntity> val) {
    _listaProdutos = val;
    service.salvar(_listaProdutos);
    notifyListeners();
  }

  void removerItem(int index) {
    listaProdutos.removeAt(index);
    service.salvar(listaProdutos);
    notifyListeners();
  }

  void addItem(CadastroEntity item) {
    listaProdutos.add(item);
    service.salvar(listaProdutos);
    notifyListeners();
  }

  // void abrirModalCadastro(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return SimpleDialog(
  //         contentPadding: const EdgeInsets.all(16),
  //         children: [
  //           NovoItemWidget(callback: (item) {
  //             listaAfazeres = [item, ...listaAfazeres];
  //           }),
  //         ],
  //       );
  //     },
  //   );
  // }
}
