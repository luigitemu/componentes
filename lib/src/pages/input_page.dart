import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _nombre='' ;
  String _email='' ;
  String _fecha = '';
  String _opcionSelecccionada = 'Volar';

  List<String> _poderes = ['Volar' , 'Rayos x' , 'Super Aliento' , 'Super Fuerza'];   
  
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
           Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0) 
        ), 
        counter: Text('Cantidad de letras: ${_nombre.length}' ),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility_new ,color: Colors.cyan),
        icon: Icon(Icons.account_circle , color: Colors.cyan,),

      ),
      onChanged: (valor)=>setState((){
        _nombre = valor;
        })
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSelecccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType:TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Email',
        hintText: 'Ingrese su Email',
        suffixIcon: Icon(Icons.alternate_email , color: Colors.cyan,),
        icon: Icon(Icons.email , color: Colors.cyan,),
      ),
      onChanged: (valor)=>setState((){
        _email = valor;
        })
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Password',
        hintText: 'Password',
        suffixIcon: Icon(Icons.lock , color: Colors.cyan,),
        icon: Icon(Icons.lock , color: Colors.cyan,),
      ),
      onChanged: (valor)=>setState((){

        })
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Fecha de nacimiento',
        hintText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar , color: Colors.cyan,),
        icon: Icon(Icons.calendar_today_sharp , color: Colors.cyan,),
      ),
      onTap: (){

        // QUitar el foco del datepicker
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );

  }

  void   _selectDate(BuildContext context) async {

      DateTime picked = await showDatePicker(
        context: context, 
        initialDate: new DateTime.now(), 
        firstDate: new DateTime(2018), 
        lastDate: new DateTime(2025),
        locale: Locale('es' , 'ES')
        );


        if(picked !=null  ){
          setState(() {
            _fecha = picked.toString();
            _inputFieldDateController.text = _fecha;
          });
        }
  }


List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> _lista = [];

    _poderes.forEach((poder) { 
      _lista.add(DropdownMenuItem(
          child: Text(poder),
          value: poder,
        ));
    });

  return _lista;
}  

  Widget _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
         Expanded(
              child: DropdownButton( 
              value: _opcionSelecccionada, 
              items: getOpcionesDropdown(),
              onChanged: (opt){
                _opcionSelecccionada = opt;
              },
        ),
         ),
      ],
    );
  }
}