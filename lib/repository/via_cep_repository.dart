import 'dart:convert';

import 'package:flutter_application_cep/model/via_cep_model.dart';
import 'package:flutter_application_cep/repository/via_cep_custom_repository.dart';

class ViaCepRepository {
  var _dioCustom = ViaCepCustomRepository();

  Future<ViaCepModel> obterCeps(String cep) async {
    var url = "https://parseapi.back4app.com/classes/ViaCep";
    
    if (cep.isNotEmpty) {
      url =
          "https://parseapi.back4app.com/classes/ViaCep?where={\"cep\":\"$cep\"}";
    }

    var response = await _dioCustom.dio.get(url);
    return ViaCepModel.fromJson(response.data);
  }

  Future<void> cadastrar(String cep) async {
    var requestCep = await getCep(cep);

    if (requestCep.isNotEmpty) {
      await _dioCustom.dio.post("https://parseapi.back4app.com/classes/ViaCep",
          data: requestCep);
    }
  }

  Future<Map<String, dynamic>> pesquisar(String cep) async {
    var response = await _dioCustom.dio.get(
        "https://parseapi.back4app.com/classes/ViaCep?where={\"cep\":\"$cep\"}");
    return response.data;
  }

  Future<Map<String, dynamic>> getCep(String cep) async {
    var response =
        await _dioCustom.dio.get("https://viacep.com.br/ws/$cep/json/");
    return response.data;
  }

  Future<void> delete(String id) async {
    await _dioCustom.dio
        .delete("https://parseapi.back4app.com/classes/ViaCep/$id");
  }
}
