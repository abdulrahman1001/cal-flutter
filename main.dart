import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cal(),
    );
  }
}

class Cal extends StatefulWidget {
  const Cal({Key? key}) : super(key: key);

  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Cal> {
  final myController = TextEditingController();

  double eval(String expression) {
    Parser parser = Parser();
    Expression exp = parser.parse(expression);

    // Simplify the expression
    exp = exp.simplify();

    // Evaluate the expression
    double result = exp.evaluate(EvaluationType.REAL, ContextModel());
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text(
          'حاسبة عبدالرحمن',
          style: TextStyle(fontSize: 33),
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: TextField(
                  readOnly: true,
                  controller: myController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(hintText: 'hi'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        String currentText = myController.text;
                        String eight = '1';
                        myController.text = currentText + eight;
                      },
                      child: Text('1'),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        String currentText = myController.text;
                        String eight = '2';
                        myController.text = currentText + eight;
                      },
                      child: Text('2'),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        String currentText = myController.text;
                        String eight = '3';
                        myController.text = currentText + eight;
                      },
                      child: Text('3'),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        String currentText = myController.text;
                        String eight = '+';
                        myController.text = currentText + eight;
                      },
                      child: Text('+'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Add more button containers here for digits and operators
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        String currentText = myController.text;
                        String eight = '=';
                        double result = eval(currentText);
                        myController.text = result.toString();
                      },
                      child: Text('='),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
