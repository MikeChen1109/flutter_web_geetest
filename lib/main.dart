import 'package:flutter/material.dart';
import 'package:js_integration/web_geetest_service/geetest_config.dart';
import 'package:js_integration/web_geetest_service/geetest_service.dart';
import 'package:js_integration/web_geetest_service/js_helper.dart';

void main() {
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
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;

  void validate() async {
    final config = GetestConfig(
      captchaId: 'c7e1bf9db5242a2bf02997ddba95a758',
      product: 'bind',
      language: 'zho-tw',
    );
    final geetestService =
        GeetestServiceImpl(jsHelper: JSHelper(), config: config);
    geetestService.showCaptcha(
      onReady: () {
        print('onReady');
      },
      onSuccess: () {
        print('onSuccess');
      },
      onFail: (reason) {
        print('onFail: $reason');
      },
      onError: (error) {
        print('onError: $error');
      },
    );
  }

  void _incrementCounter() async {
    validate();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
