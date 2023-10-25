import 'package:arquitetura_rota/extensoes.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String buttonTitle;
  final bool activated;
  final Function() onUltimosAlertasPressed;

  const MenuButton(this.buttonTitle, this.activated, this.onUltimosAlertasPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onUltimosAlertasPressed,
      child: true
          ? _ButtonActivated(buttonTitle)
          : _ButtonDisabled(buttonTitle),
    );
  }
}

class _ButtonActivated extends StatelessWidget {
  final String buttonTitle;

  const _ButtonActivated(this.buttonTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 58,
      decoration: BoxDecoration(
          color: '#d9d9d9'.toColor(),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 17),
        child: Text(
          buttonTitle,
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}

class _ButtonDisabled extends StatelessWidget {
  final String buttonTitle;

  const _ButtonDisabled(this.buttonTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 58,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 17),
        child: Text(
          buttonTitle,
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
