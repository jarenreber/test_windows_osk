import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final focusField = FocusNode(debugLabel: 'MainFocusField');

  @override
  Widget build(BuildContext context) {
    focusField.addListener(() {
      print('Focus Field Listener');
      print('Focus Field Has Focus: ${focusField.hasFocus}');
      print('Focus Field Has Primary Focus: ${focusField.hasPrimaryFocus}');
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              focusNode: focusField,
              autofocus: false,
              onTapOutside: (_) {
                // FocusManager.instance.primaryFocus
                //     ?.unfocus(disposition: UnfocusDisposition.scope);
                bool primaryFocus = focusField.hasPrimaryFocus;
                bool focus = focusField.hasFocus;

                print('App Primary Focus: $primaryFocus');
                print('Any focus Focus: $focus');

                FocusManager.instance.primaryFocus?.unfocus();
                bool primaryFocus2 = focusField.hasPrimaryFocus;
                bool focus2 = focusField.hasFocus;

                print('App Primary Focus 2: $primaryFocus2');
                print('Any focus Focus 2: $focus2');

                focusField.unfocus();
                bool primaryFocus3 = focusField.hasPrimaryFocus;
                bool focus3 = focusField.hasFocus;

                print('App Primary Focus 3: $primaryFocus3');
                print('Any focus Focus 3: $focus3');
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return SuccessPage();
                  }));
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('WAHOO SUCCESS'),
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('pop'),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.sports_basketball_outlined,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}
