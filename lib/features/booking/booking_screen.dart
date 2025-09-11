import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _agbAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buchen'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name*'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name ist ein Pflichtfeld';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'E-Mail*'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'E-Mail ist ein Pflichtfeld';
                }
                final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Bitte eine gültige E-Mail-Adresse eingeben';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Telefon'),
              keyboardType: TextInputType.phone,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Wunsch-Datum/Zeit'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Ort'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nachricht'),
              maxLines: 3,
            ),
            FormField<bool>(
              builder: (state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckboxListTile(
                      title: const Text('Ich akzeptiere die AGB*'),
                      value: _agbAccepted,
                      onChanged: (value) {
                        setState(() {
                          _agbAccepted = value!;
                          state.didChange(value);
                        });
                      },
                      subtitle: state.hasError
                          ? Text(
                              state.errorText!,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error),
                            )
                          : null,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ],
                );
              },
              validator: (value) {
                if (!_agbAccepted) {
                  return 'Bitte die AGB akzeptieren';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Implement Formspree submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Anfrage wird gesendet (TODO)')),
                  );
                }
              },
              child: const Text('Anfragen'),
            ),
          ],
        ),
      ),
    );
  }
}
