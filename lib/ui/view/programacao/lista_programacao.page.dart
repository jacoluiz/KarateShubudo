import 'package:flutter/material.dart';
import 'package:karate_shubudo/assets/karate_shubudo_icons.dart';
import 'package:karate_shubudo/ui/widgets/item_faixa.widget.dart';

class ListaProgramacaoPage extends StatelessWidget {
  const ListaProgramacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ItemFaixaWidget(
          iconData: KarateShubudo.martial_belt,
          corIcon: Colors.white,
          texto: "Faixa branca",
          sequenciaCombate: false,
        ),
        ItemFaixaWidget(
          iconData: KarateShubudo.martial_belt,
          corIcon: Colors.yellow,
          texto: "Faixa amarela",
          sequenciaCombate: false,
        ),
        ItemFaixaWidget(
          iconData: KarateShubudo.martial_belt,
          corIcon: Colors.orange,
          texto: "Faixa laranja",
          defesa: false,
        ),
        ItemFaixaWidget(
          iconData: KarateShubudo.martial_belt,
          corIcon: Colors.green,
          texto: "Faixa verde",
          defesaPessoal: false,
        ),
        ItemFaixaWidget(
          iconData: KarateShubudo.martial_belt,
          corIcon: Colors.purple,
          texto: "Faixa roxa",
          defesaPessoal: false,
        ),
        ItemFaixaWidget(
          iconData: KarateShubudo.martial_belt,
          corIcon: Colors.brown,
          texto: "Faixa marron",
        ),
      ],
    );
  }
}
