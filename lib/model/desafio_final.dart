import 'package:dart_desafio_final/model/cidade.dart';
import 'package:dart_desafio_final/respository/cidaderepository.dart';
import 'package:dart_desafio_final/respository/estadorepository.dart';
import 'package:dio/dio.dart';
import 'package:dart_desafio_final/model/estado_pais.dart';

void main() {
  buscarEstado();
}

Future<void> buscarEstado() async {
  var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
  var dio = Dio();
  Response response = await dio.get(
    (url),
  );

  if (response.statusCode == 200) {
    var json = (response.data) as List;

    var estado = json.map((item) => Estado.fromJson(item)).toList();
    var estadoRepository = EstadoRepository();

    for (var dados in estado) {
      await estadoRepository.salvarEstado(
        dados.id,
        dados.sigla,
        dados.nome,
      );
      await buscarCidade(dados.id);
    }
  }
}

Future<void> buscarCidade(int? id) async {
  var url =
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$id/distritos';
  var dio = Dio();
  Response response = await dio.get(
    (url),
  );

  if (response.statusCode == 200) {
    var json1 = response.data as List;

    var city = json1.map((cidades) => Cidade.fromJson(cidades)).toList();
    var cidadeRepository = CidadeRepository();
    for (var dados in city) {
      dados.idUf = id;

      await cidadeRepository.salvarCidade(
        dados.id,
        dados.idUf,
        dados.nome,
      );
    }
  }
}
