import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.cepContent.cep),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Card(
            child: Column(
              children: [
                // ListTile(
                //   leading: const FlutterLogo(size: 72.0),
                //   title: Text(widget.cepContent.localidade),
                //   subtitle: Text(
                //       "Bairro: ${widget.cepContent.bairro}, Logradouro : ${widget.cepContent.logradouro}, UF: ${widget.cepContent.uf}"),
                //   isThreeLine: true,
                // ),
                Container(
                  child: Column(
                    children: [
                      TextField(
                        controller: textEditingController,
                        maxLines: 5,
                        onChanged: ((value) {
                          setState(() {});
                        }),
                      ),
                      Card(
                        child: AutoSizeText(
                          textEditingController.text,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
