import 'package:flutter/material.dart';

class ModalComponent extends StatefulWidget {
  final String titulo;
  final String valor;
  const ModalComponent({super.key, required this.titulo, required this.valor});

  @override
  State<ModalComponent> createState() => _ModalComponentState();
}

class _ModalComponentState extends State<ModalComponent> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text("Descrição"),
      actionsAlignment: MainAxisAlignment.start,
      actions: [Text("titulo"), Text("valor")],
    );
  }
}
