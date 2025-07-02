import 'package:flutter/material.dart';
void main (){

runApp(const HomePage());
}

class HomePage extend StatelessWidget {
const HomePage{(superkey)};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Mein Portfolio'),
      ),
      body: const Center(
        child: Text('Willkommen im Portfolio von Ujjwal Kathet',
        style:TextStyle(fontSize: 25, color: Colors.blue)),
      ),
    );
  }
}