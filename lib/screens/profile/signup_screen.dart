import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.deepOrange[400]),
          onPressed: () => Navigator.of(context).pop(),
        ), 
      ),
      body: Padding(
        padding: EdgeInsets.only(top:60, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                child: ClipOval(
                  child: Container(
                    height: 150,
                    color: Colors.white,
                    child: Image.asset('llb_logo.jpg')
                  )
                )
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Registrate',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Colors.blueGrey[300],),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Nombre',
                ),
              ),
            ),
            Container(  
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  showDatePicker(
                    context: context,
                    initialDate:  DateTime.now(),
                    firstDate:
                          DateTime(1901),
                    lastDate:  DateTime.now().add( Duration(days: 30)),
                  ).then((date) {
                    /*
                    String formattedDate = formatDate(date, [yyyy, '/', mm, '/', dd]);
                    selectedDate = formattedDate;
                    birthDayController.text = selectedDate;
                    */
                  });
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today, color: Colors.blueGrey[300],),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Fecha de nacimiento',
                ),
              ),
            ),/*
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: DropdownButton<Item>(    
                isExpanded: true,
                hint: Text("Genero"),
                value: gender,
                onChanged: (Item value) {
                  setState(() {
                    gender = value;
                  });
                },
                items: options.map((Item item) {
                  return  DropdownMenuItem<Item>(
                    value: item,
                    child: Row(
                      children: <Widget>[
                        Text(
                          item.name,
                          style:  TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
            ),*/
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email, color: Colors.blueGrey[300],),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Correo electrónico',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.blueGrey[300],),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ), 
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.deepOrange,
                  child: Text('Registrate'),
                  onPressed: () {
                    /*
                    if (nameController.text == '' || emailController.text == '' 
                      || passwordController.text == '') {
                        signUpDialog(context, 'Por favor, completa los campos.');
                    } else if(passwordController.text.length < 8) {
                      signUpDialog(context, 'La contraseña debe de contener al menos 8 caracteres.');
                    } else if(!emailController.text.contains("@")) {
                      signUpDialog(context, 'Ingresa un correo válido.');
                    } else {
                      signUp(nameController.text, birthDayController.text, gender.name, emailController.text, passwordController.text);
                    }*/
                  },
                )),
          ],
        )
      )
    );
  }
}