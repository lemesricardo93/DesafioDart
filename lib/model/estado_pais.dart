import 'dart:convert';

class Estado {
  int? id;
  String? sigla;
  String? nome;
  Estado({
    this.id,
    this.sigla,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }

  factory Estado.fromMap(Map<String, dynamic> map) {
    return Estado(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  Estado.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    sigla = map['sigla'];
    nome = map['nome'];
  }

  @override
  String toString() => 'Estado(id: $id, sigla: $sigla, nome: $nome)';
}
