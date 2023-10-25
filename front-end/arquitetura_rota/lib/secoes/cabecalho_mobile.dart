import 'package:arquitetura_rota/extensoes.dart';
import 'package:flutter/material.dart';

class CabecalhoMobile extends StatelessWidget {

  final String logoRotaOeste = 'asset/images/rota.png';

  const CabecalhoMobile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Container(
        decoration: BoxDecoration(
          color: '#d9d9d9'.toColor()
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 121,
                width: 171,
                child: Image(
                  image: AssetImage(logoRotaOeste),
                ),
              ),
            ]),
      ),
    );
  }
}