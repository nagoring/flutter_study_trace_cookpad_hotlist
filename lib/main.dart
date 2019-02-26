import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '話題のレシピ[クックパッド]',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
//const sayHello = () => console.log("Hello " + a);

  Widget _Pagging(String text){
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),

          ),
          onTap: () async {
          },
      )
    );
  }
  Widget paggingTextByFunc(String text, Function callback)  {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),

          ),
          onTap: () async {
            callback(text);
          },
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController;
      _textController = TextEditingController(text: "");
    return Scaffold(
      drawer: Drawer(
         child: ListView(
           children: [
             ListTile(
               title: Text("おでかけ")

             ),
           ],
         )
      ),
      appBar: AppBar(
        title: Container(
            margin: EdgeInsets.all(8.0),
            child: Image.network('https://assets.cpcdn.com/assets/device/cookpad_logo_full@2x.png')
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextFormField(
              
              onFieldSubmitted: (value) => print(value),
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: '料理名,食材,目的',
                labelText: '',
                suffixIcon: GestureDetector(
                      onTap: Feedback.wrapForTap(
                        _textController.clear,
                        context,
                      ),
                      child: Icon(Icons.clear, color: Color(0xFFFFFF)),
                    ),
               ),
            ),
            Row(
              children: <Widget>[
                paggingTextByFunc("ひな祭り", (String text) => print(text)),
                paggingTextByFunc("キャラ弁", (String text) => print(text)),
                paggingTextByFunc("弁当", (String text) => print(text)),
                paggingTextByFunc("マシュマロ", (String text) => print(text)),
             ]),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
