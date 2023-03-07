import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Adapter Layout'),
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
  List intros = [
    'Age：18',
    'Gender：Male',
    'Address：Hubei Wuhan',
    'Tel：027-89244445',
    'Phone：18244224442',
    'Hoppy：Basketball,Sing,Dance,Rap',
    'School：Wuhan Experimental Middle School'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            // MediaQuery.of(context).orientation == Orientation.portrait;
            return orientation == Orientation.portrait
                ? _buildVerticalLayout()
                : _buildHorizontalLayout();
          },
        ));
  }

  _buildVerticalLayout() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _userInfo(),
            const SizedBox(
              height: 50,
            ),
            _userMessageList()
          ],
        ),
      ),
    );
  }

  _buildHorizontalLayout() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _userInfo(),
          const SizedBox(
            width: 50,
          ),
          Expanded(child: _userMessageList())
        ],
      ),
    );
  }

  _userInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.wc_outlined,
          color: Colors.blue,
          size: 80,
        ),
        Text(
          'Tom',
          style: Theme.of(context).textTheme.bodyMedium,
          textScaleFactor: 2.4,
        ),
        Text(
          'I am a student',
          style: Theme.of(context).textTheme.bodyMedium,
          textScaleFactor: 2,
        )
      ],
    );
  }

  _userMessageList() {
    TextStyle textStyle = const TextStyle(color: Colors.black, fontSize: 20);
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: intros
              .map((e) => Padding(
                    padding: const EdgeInsets.all(17),
                    child: Text(
                      e,
                      style: textStyle,
                      textScaleFactor: 1.6,
                    ),
                  ))
              .toList()),
    );
  }
}
