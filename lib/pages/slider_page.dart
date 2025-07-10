import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  final int initialValue;
  const SliderPage({super.key, required this.initialValue});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double value = 0;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider-Seite')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Slider(
              min: 0,
              max: 100,
              divisions: 100,
              value: value,
              label: value.round().toString(),
              onChanged: (v) => setState(() => value = v),
            ),
            Text('Wert: ${value.round()}'),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              color: Color.lerp(Colors.red, Colors.green, value / 100),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, value.round());
              },
              child: const Text('Zurück und Wert speichern'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/summary',
                  arguments: {
                    'profileData': null,
                    'sliderValue': value.round(),
                    'settingsData': null,
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
