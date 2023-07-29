import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/card_component.dart';
import '../../../providers/cadastro_provider.dart';

class ProdutosTab extends StatefulWidget {
  const ProdutosTab({
    super.key,
  });

  @override
  State createState() => _ProdutosTab();
}

class _ProdutosTab extends State<ProdutosTab> {
  late CadastroProvider store;

  // void onDetalhes(CadastroEntity item, int idx) {
  //   store.selecionado = item;
  //   Navigator.pushNamed(context, AppRoutes.detalhe, arguments: idx);
  // }
  void removeList(int index) {
    store.removerItem(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<CadastroProvider>(context);

    return ListView.builder(
        itemCount: store.listaProdutos.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final item = store.listaProdutos.elementAt(index);
          return Dismissible(
              key: Key(item.uuid),
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  removeList(index);
                }
              },
              child: CardComponent(item: item));
        });
  }
}
