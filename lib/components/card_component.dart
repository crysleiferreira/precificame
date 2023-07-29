import 'package:flutter/material.dart';
import 'package:precificame/components/modal_component.dart';

import '../entities/cadastro_entity.dart';

class CardComponent extends StatelessWidget {
  final CadastroEntity item;
  const CardComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.album),
              title: Text(item.nomeProduto),
              subtitle:
                  const Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              trailing: Text(item.valorProduto),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return const ModalComponent(
                          titulo: "Vestido", valor: "45.00");
                    });
                // showModalBottomSheet(
                //     context: context,
                //     builder: (_) {
                //       return const ModalComponent();
                //     });
              },
            ),
          ],
        ),
      ),
    );
  }
}
