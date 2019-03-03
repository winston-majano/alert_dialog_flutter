import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: MostrarAlerta(),
  ));
}

class MostrarAlerta extends StatefulWidget {
  @override
  _MostrarAlertaState createState() => _MostrarAlertaState();
}


enum DialogAction{
  yes,
  no
}


class _MostrarAlertaState extends State<MostrarAlerta> {


  void _resultadoAlert(DialogAction action){
    print("Has presionado $action");
  }



  void _mostrarAlert(String value){

    AlertDialog dialog = new AlertDialog(
      content: new Text(value),
      title: Text("Mostrando Texto"),
      actions: <Widget>[
      new FlatButton(onPressed: () {_resultadoAlert(DialogAction.yes);}, child: new Text("Si")),
        new FlatButton(onPressed:() {_resultadoAlert(DialogAction.no);}, child: new Text("No")),
      ],


    );

    //para mostrar alerta
    showDialog(context: context, child: dialog); // ignore: deprecated_member_use


  }

  String _inputValue = "";

  void _onchanged(String value){
    setState(() {
      _inputValue = value;

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Alert Dialog"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: new Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: "Ingrese el texto aqui"),
                onChanged: (String value){
                  _onchanged(value);
                },
              ),
              new RaisedButton(
                  child: new Text("Mostrar Alerta"),

                  onPressed: () {
                    _mostrarAlert(_inputValue);
                  })
            ],
          ),
        )
      ),
    );
  }
}
