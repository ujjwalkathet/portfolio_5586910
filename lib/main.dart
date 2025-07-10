import 'package:flutter/material.dart';
import 'pages/profile_form_page.dart';
import 'pages/slider_page.dart';
import 'pages/settings_page.dart';
import 'pages/summary_page.dart';
import 'pages/about_page.dart';
import 'pages/work_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ujjwal Kathet Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const NavigationHome(),
        '/about': (context) => const AboutPage(),
        '/work': (context) => const WorkPage(),
        '/contact': (context) => const ContactPage(),
        '/profile': (context) => const ProfileFormPage(),
        '/settings': (context) => const SettingsPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/slider') {
          final args = settings.arguments as int? ?? 50;
          return MaterialPageRoute(
            builder: (context) => SliderPage(initialValue: args),
          );
        } else if (settings.name == '/summary') {
          final args = settings.arguments as Map<String, dynamic>? ?? {};
          return MaterialPageRoute(
            builder: (context) => SummaryPage(
              profileData: args['profileData'],
              sliderValue: args['sliderValue'],
              settingsData: args['settingsData'],
            ),
          );
        }
        return null;
      },
    );
  }
}

class NavigationHome extends StatelessWidget {
  const NavigationHome({super.key});
  @override
  Widget build(BuildContext context) {
    return const HomePageWithNavigation();
  }
}

class HomePageWithNavigation extends StatefulWidget {
  const HomePageWithNavigation({super.key});
  @override
  State<HomePageWithNavigation> createState() => _HomePageWithNavigationState();
}

class _HomePageWithNavigationState extends State<HomePageWithNavigation> {
  Map<String, dynamic>? _profileData;
  int? _sliderValue;
  Map<String, dynamic>? _settingsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio Startseite'),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Navigation', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Startseite'),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Über mich'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Projekte'),
              onTap: () => Navigator.pushNamed(context, '/work'),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Kontakt'),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Willkommen im Portfolio von Ujjwal Kathet", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/profile');
                if (result != null && mounted) {
                  setState(() {
                    _profileData = result as Map<String, dynamic>;
                  });
                }
              },
              child: const Text('Profil bearbeiten'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/slider', arguments: 50);
                if (result != null && mounted) {
                  setState(() {
                    _sliderValue = result as int;
                  });
                }
              },
              child: const Text('Slider-Seite'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/settings');
                if (result != null && mounted) {
                  setState(() {
                    _settingsData = result as Map<String, dynamic>;
                  });
                }
              },
              child: const Text('Einstellungen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/summary', arguments: {
                  'profileData': _profileData,
                  'sliderValue': _sliderValue,
                  'settingsData': _settingsData,
                });
              },
              child: const Text('Zur Zusammenfassung'),
            ),
          ],
        ),
      ),
    );
  }
}
