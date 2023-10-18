import 'package:arquitetura_rota/extensoes.dart';
import 'package:flutter/material.dart';

class CardAlerta extends StatelessWidget {

  final String modelo;
  final String prioridade;
  final String alerta;
  final String data;
  final String hora;

  const CardAlerta({
    required this.modelo,
    required this.prioridade,
    required this.alerta,
    required this.data,
    required this.hora,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: '#d9d9d9'.toColor(),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    width: 100,
                    child: _ItemAlerta(titulo: modelo),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 100,
                    child: _ItemAlerta(titulo: prioridade),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 700,
                    child: _ItemAlerta(titulo: alerta),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 100,
                    child: _ItemAlerta(titulo: data),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 100,
                    child: _ItemAlerta(titulo: hora),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class _ItemAlerta extends StatelessWidget {
  final String titulo;

  const _ItemAlerta({required this.titulo, Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        titulo,
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
      ),
    );
  }
}