import 'package:flutter/material.dart';

class StudyListScreen extends StatelessWidget {
  final String data;

  const StudyListScreen({Key? key, required this.data}) : super(key: key);

  List<Widget> _parseData(String data) {
    List<Widget> widgets = [];
    final lines = data.split('**');

    for (var line in lines) {
      if (line.startsWith('**')) {
        // It's a title, make it bold
        widgets.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(line.replaceAll('**', ''),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ));
      } else if (line.isNotEmpty) {
        // It's a regular line, display as normal text
        widgets.add(Text(line));
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> contentWidgets = _parseData(data);

    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Study List'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: contentWidgets,
        ),
      ),
    );
  }
}
