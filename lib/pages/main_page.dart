import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_cep/model/tarefa_model.dart';
import 'package:flutter_application_cep/model/via_cep_model.dart';
import 'package:flutter_application_cep/pages/cep_details.dart';
import 'package:flutter_application_cep/pages/contador_page.dart';
import 'package:flutter_application_cep/repository/tarefa_repository.dart';
import 'package:flutter_application_cep/repository/via_cep_repository.dart';
import 'package:flutter_application_cep/services/dark_mode_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  int cliques = 0;
  TextEditingController _cepController = TextEditingController();
  var viaCepModel = ViaCepModel([]);
  TextEditingController _cepAddController = TextEditingController();

  // Future<void> obterDados(String cep) async {
  //   viaCepModel = await _viaCepRepository.obterCeps(cep);
  // }

  @override
  Widget build(BuildContext context) {
    print("build");
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("ViaCep App")),
            actions: [
              Center(child: Text("Dark")),
              Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
                return Switch(
                  value: darkModeService.getDarkModel,
                  onChanged: ((bool value) {
                    darkModeService.setDarkMode = !darkModeService.getDarkModel;
                  }),
                );
              }),
            ],
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Apenas não Concluidos'),
                  Consumer<TarefaRepository>(
                      builder: (_, tarefaRepository, widget) {
                    return Switch(
                      value: tarefaRepository.apenasNaoConcluido,
                      onChanged: (bool value) {
                        Provider.of<TarefaRepository>(context, listen: false)
                            .apenasNaoConcluidos = value;
                      },
                    );
                  })
                ],
              ),
              Expanded(
                child: Consumer<TarefaRepository>(
                    builder: (_, _tarefaRepository, widget) {
                  return ListView.builder(
                      itemCount: _tarefaRepository.tarefas.length,
                      itemBuilder: ((context, index) {
                        var tarefa = _tarefaRepository.tarefas[index];
                        return ListTile(
                          title: Text(tarefa.descricao),
                          trailing: Switch(
                            value: _tarefaRepository.apenasNaoConcluido,
                            onChanged: (bool value) {
                              _tarefaRepository.apenasNaoConcluidos = value;
                              Provider.of<TarefaRepository>(context,
                                      listen: false)
                                  .editar(tarefa.id, value);
                            },
                          ),
                        );
                      }));
                }),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Adicionar Novo Cep.'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          const Text('Digite o Cep Abaixo'),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            controller: _cepAddController,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Digite o Cep',
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Adicionar'),
                        onPressed: () {
                          if (_cepAddController.text.isNotEmpty) {
                            Provider.of<TarefaRepository>(context,
                                    listen: false)
                                .adicionar(
                              Tarefa(_cepAddController.text, false),
                            );
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          )),
    );
  }
}
