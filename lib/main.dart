import 'package:flutter/material.dart';
import './button.dart';
import './calculator/main.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Main();
  }
}

class _Main extends State<StatefulWidget> implements CalculatorKeyPathDelegate {
  var calculator = [
    ["AC", "C", "", "/"],
    ["7", "8", "9", "x"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["0", "00", ",", "="]
  ];
  String result = "";
  @override
  Widget build(BuildContext context) {
    var calculatorKeypath = CalculatorKeypath(calculator: calculator);
    calculatorKeypath.delegate = this;
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Calculator"),
            ),
            body: Column(
              children: <Widget>[
                Container(
                  child:
                      Text(result, style: TextStyle(fontSize: 40), maxLines: 1),
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.all(20),
                ),
                calculatorKeypath,
              ],
            )));
  }

  @override
  void click(String key) {
    setState(() {
      if (key == "=") {
        var calculatorParam = result.split(" ");
        result = Calculator().main(calculatorParam);
      } else if (key == "AC") {
        result = "";
      } else if (key == "C") {
        result = result.substring(0, result.length - 1);
      } else if (key == "x" || key == "+" || key == "-" || key == "/") {
        result += " " + key + " ";
      } else {
        result += key;
      }
    });
  }
}

class CalculatorKeypath extends StatelessWidget {
  var calculator = [];
  CalculatorKeyPathDelegate delegate;

  CalculatorKeypath({this.calculator});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          for (var row in calculator)
            Row(
              children: <Widget>[
                for (var button in row)
                  Expanded(
                    child: CalculatorButton(
                      onTap: () {
                        delegate.click(button);
                      },
                      text: button,
                    ),
                  ),
              ],
            ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      height: 468, // How to set dynamic
    );
  }
}

class CalculatorKeyPathDelegate {
  void click(String key) {}
}
