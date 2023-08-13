import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Clickable Card List Example'),
      ),
      body: Center(
        child: CardList(),
      ),
    ),
  ));
}

class CardList extends StatelessWidget {
  final List<CardItem> cardItems = [
    CardItem(
      iconData: Icons.star,
      title: 'Card 1',
      options: ['Option 1', 'Option 2', 'Option 3'],
    ),
    CardItem(
      iconData: Icons.favorite,
      title: 'Card 2',
      options: ['Option A', 'Option B', 'Option C'],
    ),
    // Add more CardItem instances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cardItems.length,
      itemBuilder: (context, index) {
        return cardItems[index];
      },
    );
  }
}

class CardItem extends StatefulWidget {
  final IconData iconData;
  final String title;
  final List<String> options;

  CardItem({
    required this.iconData,
    required this.title,
    required this.options,
  });

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<String> combinedOptions = [
      'Always Option 1',
      'Always Option 2',
      ...widget.options,
    ];

    List<String> updatedOptions = List.from(combinedOptions); // Create a copy to modify

    updatedOptions.removeWhere((option) => widget.options.contains(option));

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
            leading: Icon(widget.iconData),
            title: Text(widget.title),
            trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
          ),
          if (_isExpanded)
            Column(
              children: updatedOptions.map((option) {
                return ListTile(
                  onTap: () {
                    print('Option Clicked: $option');
                  },
                  title: Text(option),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
