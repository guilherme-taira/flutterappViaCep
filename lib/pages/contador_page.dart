import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_cep/services/contador_service.dart';
import 'package:provider/provider.dart';

class ContadorPage extends StatelessWidget {
  const ContadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ContadorService>(
              builder: (_,contadorService,widget) {
                return Text(contadorService.contador.toString());
              }
            ),
            TextButton(
              onPressed: () {
                Provider.of<ContadorService>(context, listen: false).incrementar();
              },
              child: Text("Incrementar"),
            ),
          ],
        ),
      ),
    );
  }
}
