import 'package:flutter/material.dart';



class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder()
          ),
          onPressed: () => _mostrarAlerta(context), 
          )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: (){
          Navigator.pop(context);
        }),
    );
  }


  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context ){
        return AlertDialog(
          title: Text('Titulo'),
          shape: RoundedRectangleBorder( borderRadius:BorderRadius.circular(10.0) ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de Alerta.'),
              FlutterLogo(size: 100.0) 
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cerrar'),
              onPressed: ()=>Navigator.of(context).pop(), 
              ),
            TextButton(
              child: Text('OK'),
              onPressed: ()=>Navigator.of(context).pop(), 
              ),
          ],
        );
      } 
      );
  }
}