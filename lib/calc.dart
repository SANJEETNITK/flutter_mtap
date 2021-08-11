import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> products = [];

  late int firstNumber;
  late int secondNumber;
  String textToDisplay = "";
  late String res = "";
  late String operationToPerform;

  void buttonClicked(String btnValue){
    if (btnValue == "C") {
      textToDisplay = "";
      firstNumber = 0;
      secondNumber = 0;
      res = "";
    } else if (btnValue == "+" || btnValue == "-" || btnValue == "x" || btnValue == "/") {
      firstNumber = int.parse(textToDisplay);
      res = "";
      operationToPerform = btnValue;
    } else if (btnValue == "="){
      secondNumber = int.parse(textToDisplay);
      switch(operationToPerform){
        case "+": {
          res = (firstNumber + secondNumber).toString();
          products.add(("$firstNumber $operationToPerform $secondNumber = $res"));
        }
        break;
        case "-": {
          res = (firstNumber - secondNumber).toString();
          products.add(("$firstNumber $operationToPerform $secondNumber = $res"));
        }
        break;
        case "x": {
          res = (firstNumber * secondNumber).toString();
          products.add(("$firstNumber $operationToPerform $secondNumber = $res"));
        }
        break;
        case "/": {
          res = (firstNumber / secondNumber).toString();
          products.add(("$firstNumber $operationToPerform $secondNumber = $res"));
        }
        break;
      }
    } else {
      res = int.parse(textToDisplay + btnValue).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  Widget customButton(String buttonValue) {
    return Expanded(
        child: OutlineButton(
          padding: EdgeInsets.all(25.0),
          onPressed: () => buttonClicked(buttonValue),
          child: Text(
            "$buttonValue",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 200,
              width: 300,
              child:
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${products[index]}'),
                    );
                  },
                ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$textToDisplay",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: [
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: [
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("x"),
              ],
            ),
            Row(
              children: [
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


