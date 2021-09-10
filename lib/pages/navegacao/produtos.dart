import 'package:duck_gun/widgets/destaques_widget.dart';
import 'package:duck_gun/widgets/display_prod.dart';
import 'package:duck_gun/widgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final estiloTextoPromo = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontSize: 18,
  );
  final estiloTexto =
      TextStyle(color: Colors.black, letterSpacing: 1.0, fontSize: 18);
  final estiloTitle = GoogleFonts.pressStart2p(
      color: Colors.black, letterSpacing: 1.5, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(child: FilterWidget()),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Itens em destaque',
                      style: estiloTitle,
                    ),
                  )),
                  PromoPage(),
                ],
              ),
              Container(child: DisplayWidget()),
            ],
          ),
        ],
      ),
    );
  }
}
