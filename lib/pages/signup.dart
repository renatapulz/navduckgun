import 'package:duck_gun/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/user_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String nome = "";
  String email = "";
  String senha = "";
  String registro = "";
  String cpf = "";

  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4D734F),
        title: Text('DUCK GUN',
            style: GoogleFonts.pressStart2p(
                textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -1.5))),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.transparent,
              child: CircleAvatar(
                radius: 110,
                backgroundColor: Color(0xFFA8BFB2),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pato2.png'),
                  backgroundColor: Colors.black,
                  radius: 100,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              child: Form(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Cadastro',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        onChanged: (texto) => nome = texto,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Nome Completo',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        onChanged: (texto) => email = texto,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        onChanged: (texto) => registro = texto,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Registro',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        onChanged: (texto) => cpf = texto,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(color: Colors.red.shade700),
                            hintText: '123.456.789-10',
                            labelText: 'Informe seu CPF'),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        obscureText: true,
                        onChanged: (texto) => senha = texto,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF4D734F), // background
                            onPrimary: Color(0xFF0D0D0D), // foreground
                          ),
                          onPressed: () async {
                            final user = UserModel(
                              nome: nome,
                              registro: registro,
                              cpf: cpf,
                            );
                            await userController.signup((email), senha, user);
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Criar conta',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
