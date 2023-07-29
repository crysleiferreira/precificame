import 'package:flutter/material.dart';
import 'package:precificame/pages/cadastro/cadastro_page.dart';
import 'package:precificame/providers/cadastro_provider.dart';
import 'package:provider/provider.dart';

import '../../components/body_component.dart';
import 'tabs/produtos_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CadastroProvider store;

  late int tabSelecionada;

  final List<Widget> _conteudos = [const ProdutosTab(), const CadastroPage()];
  final List<BottomNavigationBarItem> _abas = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: 'Cadastro'),
  ];

  void handleTab(int tabIdx) {
    setState(() {
      tabSelecionada = tabIdx;
    });
  }

  void removeList(int index) {
    store.removerItem(index);
  }

  @override
  void initState() {
    tabSelecionada = 0;
    store = Provider.of<CadastroProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BodyComponent(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      bar: BottomNavigationBar(
        currentIndex: tabSelecionada,
        items: _abas,
        onTap: handleTab,
      ),
      // actionButton: FloatingActionButton(
      //   onPressed: () {
      //     // store.abrirModalCadastro(context);
      //   },
      //   child: const Icon(Icons.add),
      // ),
      child: _conteudos.elementAt(tabSelecionada),
    );
  }
}
