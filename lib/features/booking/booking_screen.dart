import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotzmann_app/config/payments.dart';
import 'package:gotzmann_app/config/pricing.dart';
import 'package:gotzmann_app/services/membership_service.dart';
import 'package:url_launcher/url_launcher.dart';

// Dummy package data
class Package {
  final String id;
  final String title;
  final double price;

  Package({required this.id, required this.title, required this.price});
}

final List<Package> _dummyPackages = [
  Package(id: 'basic', title: 'Shooting: Small', price: 180.00),
  Package(id: 'standard', title: 'Shooting: Standard', price: 290.00),
  Package(id: 'premium', title: 'Shooting: Large', price: 490.00),
];

String formatChf(double amt) => 'CHF ${amt.toStringAsFixed(2)}';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _membershipService = MembershipService();

  @override
  void initState() {
    super.initState();
    // No need to call init here if we assume it's called on app startup.
    // For this screen, we can just access the cached value.
  }

  Future<void> _open(String url) async {
    if (url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PayPal-Link noch nicht hinterlegt.')),
      );
      return;
    }
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMember = _membershipService.isMember;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buchen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ..._dummyPackages.map((pkg) => Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(pkg.title,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      if (isMember) ...[
                        Text(
                          formatChf(pkg.price),
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough),
                        ),
                        Text(
                          '${formatChf(priceWithDiscount(pkg.price))} (Mitgliederpreis)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                            'Du sparst ${formatChf(pkg.price - priceWithDiscount(pkg.price))}')
                      ] else
                        Text(
                          formatChf(pkg.price),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        icon: const Icon(Icons.paypal),
                        label: const Text('Jetzt bezahlen (PayPal)'),
                        onPressed: () {
                          final link = kPaypalPackageLinks[pkg.id] ?? '';
                          _open(link);
                        },
                      )
                    ],
                  ),
                ),
              )),
          const Divider(height: 32),
          Text('Oder sende eine allgemeine Anfrage',
              style: Theme.of(context).textTheme.titleLarge),
          const BookingRequestForm(),
        ],
      ),
    );
  }
}

class BookingRequestForm extends StatefulWidget {
  const BookingRequestForm({super.key});

  @override
  State<BookingRequestForm> createState() => _BookingRequestFormState();
}

class _BookingRequestFormState extends State<BookingRequestForm> {
  final _formKey = GlobalKey<FormState>();
  bool _agbAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
    );
  }
}
