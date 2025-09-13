import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/membership_service.dart';
import '../../config/payments.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});
  @override State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  bool _loading = true;
  bool _isMember = false;

  @override
  void initState() {
    super.initState();
    MembershipService().init().then((_) {
      if (!mounted) return;
      setState(() {
        _isMember = MembershipService().isMember;
        _loading = false;
      });
    });
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
    if (_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return Scaffold(
      appBar: AppBar(title: const Text('Mitgliedschaft')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('CHF 5.00 / Monat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            const Text('Vorteile: 20% Rabatt auf alle Shootings, exklusive Aktionen.'),
            const SizedBox(height: 16),
            if (!_isMember)
              FilledButton(
                onPressed: () => _open(kPaypalMembershipLink),
                child: const Text('Mitglied werden (PayPal)'),
              )
            else
              const Text('Status: Aktives Mitglied ✅'),
            const SizedBox(height: 12),
            if (_isMember && kPaypalManageSubsLink.isNotEmpty)
              TextButton(
                onPressed: () => _open(kPaypalManageSubsLink),
                child: const Text('Mitgliedschaft verwalten / kündigen (PayPal)'),
              ),
            const Spacer(),
            Row(
              children: [
                Switch(
                  value: _isMember,
                  onChanged: (v) async {
                    await MembershipService().setMember(v);
                    if (!mounted) return;
                    setState(() => _isMember = v);
                  },
                ),
                const SizedBox(width: 8),
                const Expanded(child: Text('Mitgliedschaft-Status in der App merken (manuell).')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
