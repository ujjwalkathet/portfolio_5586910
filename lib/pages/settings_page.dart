import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _newsletterSubscribed = false;
  bool _darkModeEnabled = false;
  bool _offlineModeEnabled = false;
  bool _notificationsEnabled = true;

  Map<String, dynamic> get settingsData => {
        'newsletter': _newsletterSubscribed,
        'darkMode': _darkModeEnabled,
        'offlineMode': _offlineModeEnabled,
        'notifications': _notificationsEnabled,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Einstellungen'),
        backgroundColor: const Color.fromARGB(255, 125, 140, 214),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              title: const Text('Newsletter abonnieren'),
              value: _newsletterSubscribed,
              onChanged: (v) => setState(() => _newsletterSubscribed = v!),
            ),
            CheckboxListTile(
              title: const Text('Benachrichtigungen aktivieren'),
              value: _notificationsEnabled,
              onChanged: (v) => setState(() => _notificationsEnabled = v!),
            ),
            SwitchListTile(
              title: const Text('Dunkler Modus'),
              value: _darkModeEnabled,
              onChanged: (v) => setState(() => _darkModeEnabled = v),
            ),
            SwitchListTile(
              title: const Text('Offline-Modus'),
              value: _offlineModeEnabled,
              onChanged: (v) => setState(() => _offlineModeEnabled = v),
            ),
            const SizedBox(height: 20),
            const Text(
              'Aktuelle Auswahl:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Newsletter: ${_newsletterSubscribed ? 'Ja' : 'Nein'}'),
            Text('Benachrichtigungen: ${_notificationsEnabled ? 'An' : 'Aus'}'),
            Text('Dunkler Modus: ${_darkModeEnabled ? 'An' : 'Aus'}'),
            Text('Offline-Modus: ${_offlineModeEnabled ? 'An' : 'Aus'}'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, settingsData);
              },
              child: const Text('Zurück und speichern'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/summary',
                  arguments: {
                    'profileData': null,
                    'sliderValue': null,
                    'settingsData': settingsData,
                  },
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Direkt zur Zusammenfassung'),
            ),
          ],
        ),
      ),
    );
  }
}
