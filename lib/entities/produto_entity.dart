class ProdutoEntity {
  String uuid;
  String titulo;
  String valor;

  ProdutoEntity({
    required this.uuid,
    required this.titulo,
    required this.valor,
  });

  factory ProdutoEntity.fromJson(Map<String, dynamic> json) {
    return ProdutoEntity(
        uuid: json['uuid'], titulo: json['titulo'], valor: json['valor']);
  }

  Map<String, dynamic> toJson() {
    return {'uuid': uuid, 'titulo': titulo, 'valor': valor};
  }

  static List<ProdutoEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => ProdutoEntity.fromJson(item)).toList() ?? [];
  }
}
