import 'package:carousel_slider/carousel_slider.dart';
import 'package:duck_gun/models/produto_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoPage extends StatefulWidget {
  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  final estiloTextoPromo = GoogleFonts.roboto(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontSize: 18,
  );
  final estiloTexto = GoogleFonts.roboto(
      color: Colors.black,
      letterSpacing: 1.0,
      fontSize: 18,
      fontWeight: FontWeight.bold);

  final borderDeco = BoxDecoration(
      border: Border.all(
    color: Color(0xFFA8BFB2),
  ));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('produtos')
          .where('promocao', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CircularProgressIndicator(color: Colors.green),
            ),
          );
        }
        final promo = snapshot.data!.docs.map((map) {
          final data = map.data();
          return ProdutoModel.fromMap(data, map.id);
        }).toList();
        return CarouselSlider.builder(
          options: CarouselOptions(
            height: 310,
            autoPlay: true,
          ),
          itemCount: promo.length,
          itemBuilder: (context, index, pageIndex) {
            final item = promo[index];
            return item.imagem != null
                ? Container(
                    decoration: borderDeco,
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: MemoryImage(item.imagem!),
                                  fit: BoxFit.fill)),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                        Container(
                          child: Text(
                            item.produto,
                            style: estiloTexto,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          child: Text(
                            'R\$${item.preco}',
                            style: estiloTextoPromo,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          child: Text(
                            item.categoria,
                            style: estiloTexto,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    decoration: borderDeco,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            item.produto,
                            style: estiloTexto,
                          ),
                        ),
                        Container(
                          child: Text(
                            'R\$${item.preco}',
                            style: estiloTexto,
                          ),
                        ),
                        Container(
                          child: Text(
                            item.categoria,
                            style: estiloTexto,
                          ),
                        ),
                      ],
                    ),
                  );
          },
        );
      },
    );
  }
}
