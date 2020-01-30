import 'package:flutter/material.dart';

class BearFacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bear Facts'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Species:',
            style: TextStyle(height: 2, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'Polar Bear',
            style: TextStyle(fontSize: 18)
          ),
          Text(
            'Danger Level:',
            style: TextStyle(height: 2, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'Very Dangerous',
            style: TextStyle(fontSize: 18, color: Colors.red)
          ),
          Text(
            'How to Survive:',
            style: TextStyle(height: 2, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'If you have bear spray, use it to deter the bear. If you don\'t have bear spray then you will have to fight the bear if it has noticed you. Try to hit its weak spots. For example, punch its nose. Good luck! :)',
            style: TextStyle(fontSize: 18)
          ),
          Text(
            'Fun Fact:',
            style: TextStyle(height: 2, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'Polar bears, being almost completely unaccustomed to the presence of humans and therefore having no ingrained fear of them, will hunt people for food.',
            style: TextStyle(fontSize: 18)
          )
        ],
      )
    );
  }
}