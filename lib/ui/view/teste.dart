import 'package:flutter/material.dart';

class ExpandableCard extends StatefulWidget {
  final IconData iconData;
  final String title;
  final List<String> options;

  const ExpandableCard({
    required this.iconData,
    required this.title,
    required this.options,
  });

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> with TickerProviderStateMixin {
  late AnimationController _rotationController;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              leading: Icon(widget.iconData),
              title: Text(widget.title),
              trailing: RotationTransition(
                turns: Tween(
                  begin: 0.0,
                  end: 0.25,
                ).animate(CurvedAnimation(
                  parent: _rotationController,
                  curve: Curves.easeInOut,
                )),
                child: Icon(Icons.expand_less),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _isExpanded ? widget.options.length * 48.0 : 0,
            child: ListView.builder(
              itemCount: widget.options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.options[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Expandable Cards Example'),
      ),
      body: Center(
        child: ExpandableCard(
          iconData: Icons.category,
          title: 'Options',
          options: ['Option 1', 'Option 2', 'Option 3'],
        ),
      ),
    ),
  ));
}
