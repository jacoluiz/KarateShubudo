import 'package:flutter/material.dart';
import 'package:karate_shubudo/ui/widgets/player_video.widget.dart';

class AtaqueDeMaoPage extends StatefulWidget {
  const AtaqueDeMaoPage({super.key});

  @override
  State<AtaqueDeMaoPage> createState() => _AtaqueDeMaoPageState();
}

class _AtaqueDeMaoPageState extends State<AtaqueDeMaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ataques de Mão"),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          PlayerVideoWidget(
            videoId: "Fm_l9AFRp-I",
            startTimeSeconds: 10,
            endTimeSeconds: 20,
          ),
        ],
      ),
    );
  }
}
