import 'package:flutter/material.dart';

class CabecalhoAlerta extends StatelessWidget {
  const CabecalhoAlerta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  width: 100,
                  child: _ItemAlerta(titulo: "Modelo"),
                ),
              ),
              Expanded(
                child: SizedBox(
                    width: 100,
                    child: _ItemAlerta(titulo: "Prioridade"),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 700,
                  child: _ItemAlerta(titulo: "Alerta"),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 100,
                  child: _ItemAlerta(titulo: "Data"),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 100,
                  child: _ItemAlerta(titulo: "Hora"),
                ),
              ),
            ],
          ),
        ));
  }
}

class _ItemAlerta extends StatelessWidget {
  final String titulo;

  const _ItemAlerta({required this.titulo, Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
