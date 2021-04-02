import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {


  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            )
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _valorSlider,
      min: 30.0,
      max: 400.0, 
      onChanged: (_bloquearCheck) 
      ? null 
      : (valor){
        setState(() {
        _valorSlider = valor;  
        });
         
      }
      );
  }
  Widget _crearCheckBox() {

    return CheckboxListTile(
        value: _bloquearCheck,
        title: Text('Bloquear Slider'),        
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
        }
       );


  }

  Widget _crearImagen() {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      image:NetworkImage('https://www.megaidea.net/wp-content/uploads/2020/03/batman-clipart-3-587x1024.png') ,
      width: _valorSlider,
      fit: BoxFit.contain,
      );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
       value: _bloquearCheck,
       title: Text('Bloquear con switch'),
       onChanged: (value){
         setState(() {
           _bloquearCheck= value;
         });
       }
       );

  }

}