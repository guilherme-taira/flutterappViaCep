import 'package:flutter/material.dart';
import 'package:flutter_application_cep/pages/main_page.dart';

void main(List<String> args) {
  runApp(const CepApp());
}

class CepApp extends StatelessWidget {
  const CepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Via Cep",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const MainPage(),
    );
  }
}
