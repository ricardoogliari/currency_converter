import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CurrencyPage(),
    );
  }
}

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  TextEditingController _realValue = TextEditingController();
  TextEditingController _dollarValue = TextEditingController();
  TextEditingController _euroValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Currency Converter'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Real:',
                ),
                controller: _realValue,
                onChanged: (value) {
                  double realValue = double.tryParse(value) ?? 0;
                  double dollarValue = realValue / 5.48;
                  double euroValue = realValue / 6.36;
                  _dollarValue.text = dollarValue.toStringAsFixed(2);
                  _euroValue.text = euroValue.toStringAsFixed(2);
                },
              ),
              TextField(
                controller: _dollarValue,
                decoration: InputDecoration(
                  labelText: 'Dólar:',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Euro:',
                ),
                controller: _euroValue,
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
