import 'package:duck_gun/models/user_model.dart';
import 'package:duck_gun/pages/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Perfil extends StatefulWidget {
  final UserModel dados;

  Perfil({required this.dados});

  @override
   _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  late final nomeCont = TextEditingController()..text = widget.dados.nome;
  late final cpfCont = TextEditingController()..text = widget.dados.cpf;
  late final registroCont = TextEditingController()..text = widget.dados.registro;
  late final enderecoCont = TextEditingController()..text = widget.dados.endereco;
  late final numeroCont = TextEditingController()..text = widget.dados.numero;
  late final bairroCont = TextEditingController()..text = widget.dados.bairro;
  late final cidadeCont = TextEditingController()..text = widget.dados.cidade;
  late final estadoCont = TextEditingController()..text = widget.dados.estado;
  late final cepCont = TextEditingController()..text = widget.dados.cep;
  late final keyCont = TextEditingController()..text = widget.dados.key!;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (texto) {
                    if (texto == null || texto.isEmpty || texto.length < 3) {
                      return 'Digite seu nome';
                    }
                    return null;
                  },
                  controller: nomeCont,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),
                TextFormField(
                  validator: (texto) {
                    if (texto == null || texto.isEmpty) {
                      return 'Digite o endereço';
                    }
                    return null;
                  },
                  controller: enderecoCont,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                    border: OutlineInputBorder(),
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
                  controller: numeroCont,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Número',
                    border: OutlineInputBorder(),
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
                  controller: bairroCont,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Bairro',
                    border: OutlineInputBorder(),
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
                  controller: cidadeCont,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Cidade',
                    border: OutlineInputBorder(),
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
                  controller: estadoCont,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Estado',
                    border: OutlineInputBorder(),
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
                  controller: cepCont,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Cep',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4D734F), // background
                    onPrimary: Color(0xFF0D0D0D),
                    // foreground
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final atualizado = UserModel(
                        //  ownerKey: widget.dados.ownerKey,
                        nome: nomeCont.text,
                        cpf: cpfCont.text,
                        registro: registroCont.text,
                        endereco: enderecoCont.text,
                        numero: numeroCont.text,
                        bairro: bairroCont.text,
                        cidade: cidadeCont.text,
                        estado: estadoCont.text,
                        cep: cepCont.text,
                        key: keyCont.text,
                        //imagem: file,
                      ).toMap();
                      await FirebaseFirestore.instance
                          .collection('usuarios')
                          .doc(widget.dados.key)
                          .update(atualizado);
                    }
                  },
                  child: Text(
                    "Atualizar dados",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: TextButton.icon(
                    onPressed: () async {
                      await userController.logout();
                    },
                    label: Text('Sair'),
                    icon: Icon(Icons.exit_to_app),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xFF4D734F),
                        padding: EdgeInsets.all(10),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
