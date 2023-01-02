import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_cep/model/via_cep_model.dart';

class CepDetails extends StatefulWidget {
  final Results cepContent;
  const CepDetails({
    super.key,
    required this.cepContent,
  });

  @override
  State<CepDetails> createState() => _CepDetailsState();
}

class _CepDetailsState extends State<CepDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.cepContent.cep),
        ),
        body: Card(
          child: ListTile(
            leading: const FlutterLogo(size: 72.0),
            title: Text(widget.cepContent.localidade),
            subtitle: Text(
                "Bairro: ${widget.cepContent.bairro}, Logradouro : ${widget.cepContent.logradouro}, UF: ${widget.cepContent.uf}"),
            isThreeLine: true,
          ),
        ),
      ),
    );
  }
}
