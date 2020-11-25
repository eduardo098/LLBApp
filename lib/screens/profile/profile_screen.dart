import 'package:flutter/material.dart';
import 'package:llbapp/config/theme.dart';
import '../widgets/text.dart';
import 'profile_bloc.dart';
import 'profile.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {

  final String text;

  ProfileScreen({this.text});
   @override
   Widget build(BuildContext context) {
     profileBloc.getProfile();
     return Scaffold(
       backgroundColor: AppColors.black,
       body: StreamBuilder<ProfileResponse>(
         stream: profileBloc.subject.stream,
         builder: (context, AsyncSnapshot<ProfileResponse> snapshot) {
           List data = snapshot.data.profile;
           print(data.length);
           if (data.length == 0) {
             return loggedOutUserUI();
           } else {
             Profile profile = data[0];
             saveUserData(profile);
             return loggedUserUI();
           }
         },
       ) 
     );
   }

   Future<dynamic> saveUserData(Profile profile) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setInt('id', profile.id);
     prefs.setString('email', profile.email);
     prefs.setString('full_name', profile.name + '' + profile.lastName);
   }

   Widget loggedUserUI() {
     return SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 200),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Text('Martin Delgado', style: LLBText.HeaderLargeBold)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Text('Favoritos LLB', style: LLBText.HeaderLargeBold)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Text('Acerca de', style: LLBText.HeaderLargeBold)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Text('Contactanos', style: LLBText.HeaderLargeBold)
              ),
            ),
            SizedBox(height: 50),
            Align(
            alignment: Alignment.center,
              child: ButtonTheme(
              minWidth: 300,
              height: 50,
              child: RaisedButton(
                color: Colors.red[700],
                child: Text('CERRAR SESIÓN', style: LLBText.HeaderMedium),
                onPressed: () {
                  
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              )
            ),
          ),
          ],
        ),
      );
   }

   Widget loggedOutUserUI() {
     return SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Pawy',
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Iniciar sesión',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo Electrónico',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
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
                  color: Colors.greenAccent,
                  child: Text('Iniciar Sesión'),
                  onPressed: () {
                  },
                )),
            Container(
              child: Row(
                children: <Widget>[
                  Text('¿No tienes una cuenta?'),
                  FlatButton(
                    textColor: Colors.greenAccent,
                    child: Text(
                      'Registrate',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            )
          ],
        )
      );
   }
}
