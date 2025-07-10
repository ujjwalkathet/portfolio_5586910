import 'package:flutter/material.dart';

class ProfileFormPage extends StatefulWidget {
  const ProfileFormPage({super.key});

  @override
  State<ProfileFormPage> createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _aboutMeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _aboutMeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final aboutMe = _aboutMeController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gespeichert: $name, $email')),
      );

      Navigator.pop(context, {
        'name': name,
        'email': email,
        'aboutMe': aboutMe,
      });
    }
  }

  void _goToSummaryDirect() {
    if (_formKey.currentState!.validate()) {
      final profileData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'aboutMe': _aboutMeController.text,
      };
      Navigator.pushNamed(
        context,
        '/summary',
        arguments: {
          'profileData': profileData,
          'sliderValue': null,
          'settingsData': null,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil bearbeiten'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value == null || value.isEmpty ? 'Bitte Name eingeben' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Bitte E-Mail eingeben';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Ungültige E-Mail';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _aboutMeController,
                decoration: const InputDecoration(labelText: 'Über mich'),
                maxLines: 4,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text('Absenden und zurück'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _goToSummaryDirect,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Direkt zur Zusammenfassung'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
