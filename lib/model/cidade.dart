import 'dart:convert';

import 'package:dart_desafio_final/model/estado_pais.dart';

class Cidade {
  int? id;
  int? idUf;
  String? nome;
  Cidade({
    this.id,
    this.idUf,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUf': idUf,
      'nome': nome,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map['id'],
      idUf: map['idUf'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  Cidade.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    idUf = map['idUf'] ;
    nome = map['nome'] ?? '';
  }

  @override
  String toString() => 'Cidade(id: $id, idUf: $idUf, nome: $nome)';
}
