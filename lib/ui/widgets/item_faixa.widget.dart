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

class _CardItemFaixa extends State<ItemFaixa> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

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
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
                if (_isExpanded) {
                  _rotationController.forward();
                } else {
                  _rotationController.reverse();
                }
              });
            },
            child: ListTile(
              leading: Icon(widget.iconData, color: widget.corIcon),
              title: Text(widget.texto),
              trailing: RotationTransition(
                turns: Tween(
                  begin: 0.5,
                  end: 0.0,
                ).animate(CurvedAnimation(
                  parent: _rotationController,
                  curve: Curves.easeInOut,
                )),
                child: const Icon(Icons.expand_less),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _isExpanded ? opcoes.length * 55.0 : 0,
            child: ListView.builder(
              itemCount: opcoes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(opcoes[index]),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
