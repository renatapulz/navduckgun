import 'package:duck_gun/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'controllers/user_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

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
  String endereco = "";
  String numero = "";
  String bairro = "";
  String cidade = "";
  String estado = "";
  String cep = "";
  final _formKey = GlobalKey<FormState>();

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
                key: _formKey,
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
                        validator: (texto) {
                          if (texto == null || texto.isEmpty || texto.length < 3) {
                            return 'Digite seu nome';
                          }
                          return null;
                        },
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
                        validator: (texto) {
                          if (texto == null || texto.isEmpty || !EmailValidator.validate(texto)) {
                            return 'Digite um email válido';
                          }
                          return null;
                        },
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
                        validator: (texto) {
                          if (texto == null || texto.isEmpty) {
                            return 'Digite o número de registro';
                          }
                          return null;
                        },
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
                        validator: (texto) {
                          if (texto == null || texto.isEmpty || !CPFValidator.isValid(texto)) {
                            return 'Digite um cpf válido';
                          }
                          return null;
                        },
                        onChanged: (texto) => cpf = texto,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(color: Colors.red.shade700),
                            hintText: '123.456.789-10',
                            labelText: 'CPF'),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        validator: (texto) {
                          if (texto == null || texto.isEmpty) {
                            return 'Digite o endereço';
                          }
                          return null;
                        },
                        onChanged: (texto) => endereco = texto,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Endereço',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        validator: (texto) {
                          if (texto == null || texto.isEmpty) {
                            return 'Digite o número da residência';
                          }
                          return null;
                        },
                        onChanged: (texto) => numero = texto,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Número',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        validator: (texto) {
                          if (texto == null || texto.isEmpty) {
                            return 'Digite o nome do bairro';
                          }
                          return null;
                        },
                        onChanged: (texto) => bairro = texto,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Bairro',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        validator: (texto) {
                          if (texto == null || texto.isEmpty) {
                            return 'Digite o nome da cidade';
                          }
                          return null;
                        },
                        onChanged: (texto) => cidade = texto,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Cidade',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        validator: (texto) {
                          if (texto == null || texto.isEmpty) {
                            return 'Digite o nome do estado';
                          }
                          return null;
                        },
                        onChanged: (texto) => estado = texto,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Estado',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        validator: (texto) {
                          if (texto == null || texto.isEmpty || texto.length < 8) {
                            return 'Digite seu cep';
                          }
                          return null;
                        },
                        onChanged: (texto) => cep = texto,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Cep',
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        validator: (texto) {
                          if (texto == null || texto.isEmpty || texto.length < 8) {
                            return 'Digite uma senha com 8 ou mais caracteres';
                          }
                          return null;
                        },
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
                            if (_formKey.currentState!.validate()) {
                              final user = UserModel(
                                nome: nome,
                                registro: registro,
                                cpf: cpf,
                                endereco: endereco,
                                numero: numero,
                                bairro: bairro,
                                cidade: cidade,
                                estado: estado,
                                cep: cep,
                              );
                              await userController.signup((email), senha, user);
                              Navigator.pop(context);
                            }
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
