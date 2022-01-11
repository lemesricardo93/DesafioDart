import 'package:dart_desafio_final/database/database.dart';
import 'package:dart_desafio_final/model/estado_pais.dart';
import 'package:mysql1/mysql1.dart';

class EstadoRepository {
  Future<void> salvarEstado(int? id, String? sigla, String? nome) async {
    final database = await Database();
    database.close;
    var mysqlConnection = await database.openConnection();

    await mysqlConnection.query(
      'insert into estado (id, uf, nome) VALUES (?,?,?)',
      [
        id,
        sigla,
        nome,
      ],
    );
    mysqlConnection.close;
    database.close;
  }
}
