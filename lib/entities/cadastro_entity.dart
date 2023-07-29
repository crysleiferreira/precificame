class CadastroEntity {
  String uuid;
  String nomeProduto;
  String valorProduto;
  String quantidade;
  String frete;

  CadastroEntity({
    required this.uuid,
    required this.valorProduto,
    required this.nomeProduto,
    required this.quantidade,
    required this.frete,
  });

  factory CadastroEntity.fromJson(Map<String, dynamic> json) {
    return CadastroEntity(
        uuid: json['uuid'],
        nomeProduto: json['nomeProduto'],
        frete: json['frete'],
        quantidade: json['quantidade'],
        valorProduto: json['valorProduto']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'nomeProduto': nomeProduto,
      'frete': quantidade,
      'quantidade': valorProduto,
      'valorProduto': frete
    };
  }

  static List<CadastroEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => CadastroEntity.fromJson(item)).toList() ?? [];
  }
}
