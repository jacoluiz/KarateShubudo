import 'package:flutter/material.dart';

class ItemFaixa extends StatefulWidget {
  final IconData iconData;
  final Color corIcon;
  final String texto;
  final bool? defesa;
  final bool? defesaPessoal;
  final bool? sequenciaCombate;

  const ItemFaixa({
    super.key,
    required this.iconData,
    required this.texto,
    this.defesa,
    this.defesaPessoal,
    this.sequenciaCombate,
    required this.corIcon,
  });

  @override
  _CardItemFaixa createState() => _CardItemFaixa();
}

class _CardItemFaixa extends State<ItemFaixa> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<String> opcoes = ['Ataque de mão', 'Chutes', 'Defesas', 'Defesas pessoais', 'Sequencia de combate', 'Katas'];

    if (widget.defesa == false) {
      opcoes.removeWhere((opcao) => opcao == 'Defesas');
    }
    if (widget.defesaPessoal == false) {
      opcoes.removeWhere((opcao) => opcao == 'Defesas pessoais');
    }
    if (widget.sequenciaCombate == false) {
      opcoes.removeWhere((opcao) => opcao == 'Sequencia de combate');
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            leading: Icon(widget.iconData, color: widget.corIcon),
            title: Text(widget.texto),
            trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
          ),
          if (_isExpanded)
            Column(
              children: opcoes.map((opcao) {
                return ListTile(
                  onTap: () {
                    print('Option Clicked: $opcao');
                  },
                  title: Text(opcao),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
