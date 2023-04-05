import 'package:atividade2/Resultado.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


// Fabrício Terra de Lima e Andressa Tavares

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(name: "/",
        path: "/",
        builder: (context, state) => const Calculo(),
        routes: [
          GoRoute(
            name: "Resultado",
            path: "Resultado/:altura",
            builder: (context, state) => Resultado(altura: state.params["altura"]!,
    peso: state.queryParams["peso"]!,
    idade: state.queryParams["idade"]!,
    sexo: state.queryParams["sexo"]!, ),
            )  
          ],
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: _router,
      title: 'Calculo IMC',
    ) ;
  }
}
class Calculo extends StatelessWidget{
  const Calculo({super.key});
  @override
  Widget build(BuildContext context) {
    var txtAltura =
      TextEditingController(); 
  var txtPeso =
      TextEditingController(); 
  var txtIdade = TextEditingController();
  String txtSexo = "Masculino";
    return Scaffold(
      appBar: AppBar(title: Text('Coloque as informacões')
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_people_outlined,
              color: Colors.lightBlue,
              size: 140.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: txtAltura,
                    decoration: const InputDecoration(
                      labelText: 'Altura',
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(color: Colors.green, fontSize: 20.0),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: txtPeso,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: 'Peso',
                      labelStyle: const TextStyle(color: Colors.green),
                      border: const OutlineInputBorder(),
                    ),
                    style: const TextStyle(color: Colors.green, fontSize: 20.0),

                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: txtIdade,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: 'Idade',
                      labelStyle: const TextStyle(color: Colors.green),
                      border: const OutlineInputBorder(),
                    ),
                    style: const TextStyle(color: Colors.green, fontSize: 20.0),

                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Selecione o gênero: '),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DropdownButton<String>(
                            value: txtSexo,
                            onChanged: (String? newValue){
                              txtSexo = newValue!;
                            },
                            items: <String>['Masculino', 'Feminino']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ]),
                Center(
                  child: ElevatedButton(
                    onPressed: () => context.goNamed("Resultado", params: {
                      "altura": txtAltura.text
                    }, queryParams: {
                      "peso": txtPeso.text,
                      "idade": txtIdade.text,
                      "sexo": txtSexo
                    }),
                    child: const Text('Calcular índices'),
                  ),
                ),
              ],
            )
          ],
        )
      );
  }
}