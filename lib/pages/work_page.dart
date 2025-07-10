import 'package:flutter/material.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meine Projekte'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Projekte im Flutter-Praktikum',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profilbearbeitung'),
            subtitle: Text('Formular mit Validierung für Name, E-Mail und Beschreibung.'),
          ),
          ListTile(
            leading: Icon(Icons.tune),
            title: Text('Slider-Seite'),
            subtitle: Text('Interaktiver Slider mit dynamischer Farbanzeige.'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Einstellungen'),
            subtitle: Text('Checkboxen und Switches mit Zusammenfassung der Auswahl.'),
          ),
          ListTile(
            leading: Icon(Icons.summarize),
            title: Text('Zusammenfassung'),
            subtitle: Text('Alle gesammelten Daten übersichtlich dargestellt.'),
          ),
        ],
      ),
    );
  }
}