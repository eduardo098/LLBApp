import 'package:flutter/material.dart';
import 'package:llbapp/config/theme.dart';
import '../widgets/text.dart';
import 'profile_bloc.dart';
import 'profile.dart';
import 'dart:async';
import 'dart:convert';
import 'signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repos/profile_repository.dart';

class ProfileScreen extends StatelessWidget {

  final String text;

  ProfileRepository _profileRepository = ProfileRepository();

  //LoginControllers
  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  ProfileScreen({this.text});
   @override
   Widget build(BuildContext context) {
     profileBloc.getProfile();
     return Scaffold(
       backgroundColor: AppColors.black,
       body: StreamBuilder<ProfileResponse>(
         stream: profileBloc.subject.stream,
         builder: (context, AsyncSnapshot<ProfileResponse> snapshot) {
           if(snapshot.connectionState == ConnectionState.waiting) {
             return LinearProgressIndicator();
           } else if (snapshot.connectionState == ConnectionState.active) {
             List data = snapshot.data.profile;
             print(data.length == 0);
             if (data.isEmpty) {
               return Center(
                   child: loggedOutUserUI(context)
               );
             } else {
               Profile profile = data[0];
               return loggedUserUI(context, profile);
             }
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

   Widget loggedUserUI(BuildContext context, Profile perfil) {
     return SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 200),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Text(perfil.name + " " + perfil.lastName, style: LLBText.HeaderLargeBold)
              ),
            ),
            GestureDetector(
              onTap: () {
                aboutDialog(context, "LowLowBurger Android 1.0Alpha.",  "Trabajo aún en construcción, disculpa las molestias.");
              },
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                    child: Text('Acerca de', style: LLBText.HeaderLargeBold)
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                loginDialog(context, "Aqui va la info de la empresa xd.");
              },
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                    child: Text('Contactanos', style: LLBText.HeaderLargeBold)
                ),
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
                  logOut();
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

   Future<dynamic> logOut() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.clear().whenComplete(() {
       profileBloc.getProfile();
     });
   }

   Widget loggedOutUserUI(BuildContext context) {
     return SingleChildScrollView(
        child: ListView(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
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
                  'Iniciar sesión',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: loginEmailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.email, color: Colors.blueGrey[300],),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Correo Electrónico',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: loginPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.blueGrey[300],),
                  filled: true,
                  fillColor: Colors.white,
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
                  child: Text('Iniciar Sesión'),
                  onPressed: () {
                    Profile profile = Profile();
                    Map loginJSON = {
                      "email": this.loginEmailController.text,
                      "password": this.loginPasswordController.text
                    };
                    print(json.encode(loginJSON));
                    _profileRepository.login(loginJSON).then((value) {
                      if (value.error.length > 0) {
                        print("Error::: " + value.error);
                        loginDialog(context, "Error de credenciales.");
                      } else {
                        print(value.profile[0]);
                        profile = value.profile[0];
                        saveUserData(profile).then((value) {
                          profileBloc.getProfile();
                        });
                      }
                    });
                  },
                )),
            Container(
              child: Row(
                children: <Widget>[
                  Text('¿No tienes una cuenta?', style: TextStyle(color: Colors.white),),
                  FlatButton(
                    textColor: Colors.deepOrange[300],
                    child: Text(
                      'Registrate',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
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

  void aboutDialog(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Container(
                width: double.maxFinite,
                child: Text(message)
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }

  void loginDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                width: double.maxFinite,
                child: Text(message)
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }
}
