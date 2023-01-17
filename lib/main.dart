import 'package:flutter/material.dart';
import 'package:flutter_application_cep/pages/main_page.dart';
import 'package:flutter_application_cep/repository/tarefa_repository.dart';
import 'package:flutter_application_cep/services/contador_service.dart';
import 'package:flutter_application_cep/services/dark_mode_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_cep/services/dark_mode_service.dart';

void main(List<String> args) {
  runApp(const CepApp());
}

class CepApp extends StatelessWidget {
  const CepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(
          create: ((context) => DarkModeService()),
        ),
        ChangeNotifierProvider<ContadorService>(
            create: (context) => ContadorService()),
        ChangeNotifierProvider<TarefaRepository>(
            create: ((context) => TarefaRepository())),
      ],
      child: Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
        return MaterialApp(
          title: "Via Cep",
          debugShowCheckedModeBanner: false,
          theme: darkModeService.getDarkModel
              ? ThemeData.dark()
              : ThemeData.light(),
          home: MainPage(),
        );
      }),
    );
  }
}
