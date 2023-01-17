// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_cep/model/via_cep_model.dart';
// import 'package:flutter_application_cep/pages/cep_details.dart';
// import 'package:flutter_application_cep/pages/contador_page.dart';
// import 'package:flutter_application_cep/repository/via_cep_repository.dart';
// import 'package:flutter_application_cep/services/dark_mode_service.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:provider/provider.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int cliques = 0;
//   TextEditingController _cepController = TextEditingController();
//   var _viaCepRepository = ViaCepRepository();
//   var viaCepModel = ViaCepModel([]);
//   TextEditingController _cepAddController = TextEditingController();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     obterDados("");
//   }

//   Future<void> obterDados(String cep) async {
//     viaCepModel = await _viaCepRepository.obterCeps(cep);
//     setState(() {});
//   }

//   Future<void> _showMyDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Adicionar Novo Cep.'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 const Text('Digite o Cep Abaixo'),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 TextField(
//                   controller: _cepAddController,
//                   obscureText: false,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Digite o Cep',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Adicionar'),
//               onPressed: () {
//                 if (_cepAddController.text.isNotEmpty) {
//                   _viaCepRepository.cadastrar(_cepAddController.text);
//                 }
//                 setState(() {
//                   obterDados("");
//                 });
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _showQuestionCreate() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Cep Não Esta Cadastrado!'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: const <Widget>[
//                 Text('Deseja Cadastrar?'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Não'),
//               onPressed: () {
//                 setState(() {});
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Sim'),
//               onPressed: () {
//                 if (_cepAddController.text.isNotEmpty) {
//                   _viaCepRepository.cadastrar(_cepAddController.text);
//                 }
//                 setState(() {});
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("build");
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Center(child: Text("ViaCep App")),
//           actions: [
//             Center(child: Text("Dark")),
//             Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
//               return Switch(
//                 value: darkModeService.getDarkModel,
//                 onChanged: ((bool value) {
//                   darkModeService.setDarkMode = !darkModeService.getDarkModel;
//                 }),
//               );
//             }),
//           ],
//         ),
//         body: Column(
//           children: [
            
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//               child: TextField(
//                 onChanged: (value) async {
//                   if (_cepController.text.length >= 9) {
//                     await obterDados(value);
//                     setState(() {});
//                   } else {
//                     await obterDados("");
//                     setState(() {});
//                   }
//                 },
//                 controller: _cepController,
//                 obscureText: false,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Digite o Cep',
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 // child: ListView.builder(
//                 //   itemCount: viaCepModel.results.length,
//                 //   itemBuilder: ((context, index) {
//                 //     var cepContent = viaCepModel.results[index];
//                 //     return Dismissible(
//                 //       background: Container(
//                 //         color: Colors.red,
//                 //       ),
//                 //       onDismissed: (DismissDirection dismissDirection) async {
//                 //         await _viaCepRepository.delete(cepContent.objectId);
//                 //         //obterTarefas();
//                 //       },
//                 //       key: Key(cepContent.localidade),
//                 //       child: InkWell(
//                 //         onTap: (() {
//                 //           Navigator.push(
//                 //             context,
//                 //             MaterialPageRoute(
//                 //               builder: ((context) =>
//                 //                   CepDetails(cepContent: cepContent)),
//                 //             ),
//                 //           );
//                 //         }),
//                 //         child: ListTile(
//                 //           leading: const FaIcon(
//                 //             FontAwesomeIcons.mapLocation,
//                 //             color: Colors.blue,
//                 //             size: 30,
//                 //             textDirection: TextDirection.ltr,
//                 //           ),
//                 //           title: Text(cepContent.localidade),
//                 //           subtitle: Text(
//                 //               "${cepContent.logradouro} , ${cepContent.bairro} , ${cepContent.uf}.."),
//                 //         ),
//                 //       ),
//                 //     );
//                 //   }),
//                 // ),
//               ),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             await _showMyDialog();
//             setState(() {});
//           },
//           child: const Icon(Icons.add_location_alt),
//         ),
//       ),
//     );
//   }
// }
