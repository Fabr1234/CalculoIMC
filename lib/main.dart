import 'package:atividade2/resultado.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp(
    home: const Calculo(),
    theme: ThemeData(hintColor: Colors.green, primaryColor: Colors.white),
  ));
}

class Calculo extends StatefulWidget {
  const Calculo({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(routes: [
      GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => const Calculo(),
          routes: [
            GoRoute(
                name: 'Resultado',
                path: 'Resultado/:altura/:peso/:idade/:sexo',
                builder: (context, state) {
                  state.queryParams.forEach(
                    (key, value) {
                      print("$key:$value");
                    },
                  );
                  return Resultado(altura: state.params["altura"]!);
                }),
          ])
    ]);
    return MaterialApp.router(
      routerConfig : router,
      title:"Resultado"
    ) ;
  }
  @override
  State<Calculo> createState() => _CalculoState();
}

class _CalculoState extends State<Calculo> {
  var txtAltura =
      TextEditingController(); 
  var txtPeso =
      TextEditingController(); 
  var txtIdade = TextEditingController();
  String txtSexo = "Masculino";

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: const Text('Cálculos Saudáveis'),
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
                            onChanged: (String? newValue) {
                              setState(() {
                                txtSexo = newValue!;
                              });
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
        )));
  }

}