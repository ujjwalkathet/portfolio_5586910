import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final Map<String, dynamic>? profileData;
  final int? sliderValue;
  final Map<String, dynamic>? settingsData;

  const SummaryPage({
    super.key,
    this.profileData,
    this.sliderValue,
    this.settingsData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zusammenfassung'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Gesammelte Informationen:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

            if (profileData != null) ...[
              const SizedBox(height: 20),
              const Text('🧑 Profil:', style: TextStyle(fontSize: 18)),
              Text('Name: ${profileData!['name']}'),
              Text('E-Mail: ${profileData!['email']}'),
              Text('Über mich: ${profileData!['aboutMe']}'),
            ],

            if (sliderValue != null) ...[
              const SizedBox(height: 20),
              const Text('🎚️ Slider-Wert:', style: TextStyle(fontSize: 18)),
              Text('Ausgewählter Wert: $sliderValue'),
            ],

            if (settingsData != null) ...[
              const SizedBox(height: 20),
              const Text('⚙️ Einstellungen:', style: TextStyle(fontSize: 18)),
              Text('Newsletter: ${settingsData!['newsletter'] ? 'Ja' : 'Nein'}'),
              Text('Benachrichtigungen: ${settingsData!['notifications'] ? 'An' : 'Aus'}'),
              Text('Dunkler Modus: ${settingsData!['darkMode'] ? 'An' : 'Aus'}'),
              Text('Offline-Modus: ${settingsData!['offlineMode'] ? 'An' : 'Aus'}'),
            ],

            if (profileData == null && sliderValue == null && settingsData == null)
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    'Noch keine Daten vorhanden.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
