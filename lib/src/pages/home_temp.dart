import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children:_crearItemsCorta()
      ),
    );
  }

  List<Widget> _crearItems(){
      List<Widget> lista = <Widget>[];
      
      for (String opt in opciones) {
        final tempWidget = ListTile(
          title: Text(opt),
        );
        lista..add(tempWidget)
             ..add(Divider());
      }
      return lista;
  }


  List<Widget> _crearItemsCorta(){

    return  opciones.map((String item ){
        return Column(
          children: [
            ListTile(
              title: Text(item ),
              subtitle: Text('cualquier cosa'),
              leading: Icon(Icons.accessibility),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){},
              ),
            Divider()
          ],
        );
      }).toList();


    
  }

}
