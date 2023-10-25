import 'package:arquitetura_rota/extensoes.dart';
import 'package:flutter/material.dart';

class CardAlertaMobile extends StatelessWidget {
  final String modelo;
  final String prioridade;
  final String alerta;
  final String data;
  final String hora;

  const CardAlertaMobile(
      {required this.modelo,
      required this.prioridade,
      required this.alerta,
      required this.data,
      required this.hora,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: '#d9d9d9'.toColor(),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      _NomeItem(titulo: 'ID Alerta'),
                      _ItemAlerta(titulo: modelo)
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      _NomeItem(titulo: 'Prioridade'),
                      _ItemAlerta(titulo: prioridade)
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      _NomeItem(titulo: 'Alerta'),
                      _ItemAlerta(titulo: alerta)
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      _NomeItem(titulo: 'Data'),
                      _ItemAlerta(titulo: data)
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      _NomeItem(titulo: 'Hora'),
                      _ItemAlerta(titulo: hora)
                    ],
                  ),
                ),
    ]))));
  }
}

class _NomeItem extends StatelessWidget {
  final String titulo;

  const _NomeItem({required this.titulo, Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        titulo,
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),
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
