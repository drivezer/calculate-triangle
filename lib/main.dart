import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExWorkshop(),
    );
  }
}

class Ex1Widget extends StatelessWidget {
  const Ex1Widget({super.key});

  Text myText(String text, Color? color, double? fontSize) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            myText('Child#1', null, null),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  myText('Child#1.5a ', Colors.green, 28),
                  myText('Child#1.5b ', Colors.greenAccent, 28),
                  myText('Child#1.5c', Colors.lightGreen, 28),
                ],
              ),
            ),
            myText('Child#2', null, null),
            myText('Child#3', Colors.blue, 28),
            myText('Child#4', Colors.red, 28),
          ],
        ),
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _derementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'คุณทำการกดปุ่มนี้เป็นจำนวนกี่ครั้ง',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () => setState(() => _counter -= 10),
              tooltip: 'ลบ 10',
              child: const Icon(Icons.replay_10),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: _derementCounter,
              tooltip: 'ลบ',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => setState(() => _counter = 0),
              tooltip: 'รีเซ็ต',
              child: const Icon(Icons.exposure_zero),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'เพิ่ม',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => setState(() => _counter += 10),
              tooltip: 'เพิ่ม 10',
              child: const Icon(Icons.forward_10),
            ),
          ],
        ),
      ),
    );
  }
}

class ExWorkshop extends StatefulWidget {
  const ExWorkshop({super.key});

  @override
  State<ExWorkshop> createState() => _ExWorkshopState();
}

class _ExWorkshopState extends State<ExWorkshop> {
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double result = 0;

  void calculate() {
    setState(() {
      result = (0.5 *
          double.parse(_baseController.text) *
          double.parse(_heightController.text));
      _baseController.text = '';
      _heightController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'คำนวณพื้นที่สามเหลี่ยมมุมฉาก',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        child: TextFormField(
                          controller: _baseController,
                          decoration: const InputDecoration(
                            labelText: 'ฐาน',
                            hintText: 'ใส่จำนวนฐาน',
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        child: TextFormField(
                          controller: _heightController,
                          decoration: const InputDecoration(
                            labelText: 'สูง',
                            hintText: 'ใส่จำนวนสูง',
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  result > 0
                      ? const Text('ผลลัพธ์',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))
                      : Container(),
                  result > 0
                      ? Text('$result', style: const TextStyle(fontSize: 18))
                      : Container(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => calculate(),
                    child: const Text('คำนวณ'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
