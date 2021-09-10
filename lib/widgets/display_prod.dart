import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duck_gun/models/produto_model.dart';
import 'package:duck_gun/pages/controllers/filter_controller.dart';
import 'package:flutter/material.dart';

class DisplayWidget extends StatefulWidget {
  @override
  _DisplayWidgetState createState() => _DisplayWidgetState();
}

class _DisplayWidgetState extends State<DisplayWidget> {
  final estiloTextoPromo = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontSize: 18,
  );
  final estiloTexto =
      TextStyle(color: Colors.black, letterSpacing: 1.0, fontSize: 18);

  final borderDeco = BoxDecoration(
    border: Border.all(color: Color(0xFFA8BFB2)),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: filterController,
        builder: (context, Widget? child) {
          return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('produtos')
                .where('categoria', isEqualTo: filterController.dropdownValue1)
                .orderBy(filterController.dropdownValue2)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final promo = snapshot.data!.docs
                  .map((map) {
                    final data = map.data();
                    return ProdutoModel.fromMap(data, map.id);
                  })
                  .where((valor) => valor.produto
                      .toLowerCase()
                      .contains(filterController.searchValue.toLowerCase()))
                  .toList();
              return ListView.builder(
                shrinkWrap: true,
                itemCount: promo.length,
                itemBuilder: (context, index) {
                  final prod = promo[index];
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: borderDeco,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            child: prod.imagem != null
                                ? Container(
                                    child: Image.memory(
                                      prod.imagem!,
                                      width: 280,
                                      height: 280,
                                    ),
                                  )
                                : Container(
                                    child: Icon(
                                        Icons.image_not_supported_outlined),
                                    width: 250,
                                    height: 250,
                                    color: Colors.blue,
                                  ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 1),
                            child: Text(
                              prod.produto,
                              style: estiloTexto,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 1),
                            child: Text(
                              prod.promocao!
                                  ? '*Super Promoção\n R\$${prod.preco}'
                                  : 'R\$${prod.preco}',
                              style: estiloTextoPromo,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 1),
                            child: Text(
                              prod.categoria,
                              style: estiloTexto,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 1),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Comprar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
