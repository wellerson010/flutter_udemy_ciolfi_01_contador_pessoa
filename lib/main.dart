import 'package:flutter/material.dart';

//ponto inicial da aplicação. Toda aplicação Flutter necessita de uma função main que é por onde ela começa a ser rodada
void main(){
  runApp(MaterialApp(
    title: 'Contador de Pessoas', //no Android, é o que aparece no título quando mostra os apps recentes
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  int _people = 0;
  String _infoText = 'Pode entrar';

  void _changePeople(int value){
    setState(() {
      _people += value;

      if (_people < 0){
        _infoText = 'Mundo invertido?';
      }
      else if (_people <= 10){
        _infoText = 'Pode entrar';
      }
      else {
        _infoText = 'Lotado!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
  return Stack(
    children: <Widget>[
      Opacity(
        opacity: 0.3,
        child: Image.asset('images/restaurante.jpg', fit: BoxFit.cover, height: 1000),
      ),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pessoas: $_people', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  child: FlatButton(
                    child: Text('+1', style: TextStyle(color: Colors.white, fontSize: 40),),
                    onPressed: () { _changePeople(1);},
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Padding(
                  child: FlatButton(
                    child: Text('-1', style: TextStyle(color: Colors.white, fontSize: 40)),
                    onPressed: (){
                      _changePeople(-1);
                    },
                  ),
                  padding: EdgeInsets.all(10),
                )

              ],
            ),
            Text(_infoText, style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30
            ))
          ],
        ),
      )
    ],
  );
  }
}