import 'package:flutter/material.dart';

class NewsPost extends StatelessWidget {
  const NewsPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [Text("Title"), Text("Contentet")],
      ),
    );
  }
}
