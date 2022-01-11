import 'package:dart_desafio_final/database/database.dart';
import 'package:dart_desafio_final/model/cidade.dart';

class CidadeRepository {
  Future<void> salvarCidade(int? id, int? idUf, String? nome) async {
    final database2 = await Database();
    database2.close;
    var mysqlConnection5 = await database2.openConnection();
    print('Inserindo cidades');

    await mysqlConnection5
        .query('insert into cidade(id,id_uf,nome) values(?,?,?)', [
      id,
      idUf,
      nome,
    ]);
    mysqlConnection5.close();

    database2.close;
  }
}
