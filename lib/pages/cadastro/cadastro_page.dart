import 'dart:io';

import 'package:flutter/material.dart';
import 'package:precificame/providers/cadastro_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../entities/cadastro_entity.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  late CadastroProvider store;

  String produto = '';
  String valorProduto = '';
  String qtd = '';
  String frete = '';

  dynamic calculo(valor, qtd, frete) {
    dynamic calculo = valor + frete / qtd;
    return calculo;
  }

  void addList(CadastroEntity item) {
    store.addItem(item);
    _showToast(context);
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Cadastrado com Sucesso'),
        action: SnackBarAction(
            label: 'X',
            onPressed: () {
              scaffold.hideCurrentSnackBar;
              sleep(const Duration(seconds: 1));
              Navigator.pushNamed(context, "/");
            }),
      ),
    );
  }

  @override
  void initState() {
    store = Provider.of<CadastroProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            onChanged: (text) {
              produto = text;
            },
            decoration: const InputDecoration(
                labelText: 'Produto', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (text) {
              valorProduto = text;
            },
            decoration: const InputDecoration(
                labelText: 'Valor do Produto', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (text) {
              qtd = text;
            },
            decoration: const InputDecoration(
                labelText: 'Quantidade', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (text) {
              frete = text;
            },
            decoration: const InputDecoration(
                labelText: 'Frete', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                dynamic item = CadastroEntity(
                    uuid: const Uuid().v4(),
                    frete: frete,
                    nomeProduto: produto,
                    valorProduto: valorProduto,
                    quantidade: qtd);
                addList(item);
              },
              child: const Text('Cadastrar'))
        ],
      ),
    );
  }
}
