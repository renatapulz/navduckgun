import 'package:duck_gun/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class Perfil extends StatefulWidget {
  final UserModel dados;

  Perfil({required this.dados});

  @override
  _PerfilState createState() => _PerfilState();

}

 class _PerfilState extends State<Perfil> {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
                TextFormField(
                  controller: nomeCont,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 12),
                TextFormField(
                  controller: enderecoCont,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 12),
                TextFormField(
                  controller: numeroCont,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Número',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 12),
                TextFormField(
                  controller: bairroCont,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Bairro',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 12),
                TextFormField(
                  controller: cidadeCont,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Cidade',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 12),
                TextFormField(
                  controller: estadoCont,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Estado',
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 12),
                TextFormField(
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

                  //Navigator.pop(context);
                },
                child: Text("Atualizar dados", style: TextStyle(
                  color: Colors.white,
                ), ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}