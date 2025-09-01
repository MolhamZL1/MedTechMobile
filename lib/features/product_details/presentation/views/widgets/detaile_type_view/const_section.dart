import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConstSection extends StatefulWidget {
  const ConstSection({super.key});

  @override
  State<ConstSection> createState() => _ConstSectionState();
}

class _ConstSectionState extends State<ConstSection> {
  static const String supportNumber = '+963988159532'; // رقم الدعم

  Future<void> _callSupport(BuildContext context) async {
    final uri = Uri(scheme: 'tel', path: supportNumber);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تعذر فتح تطبيق الاتصال')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Need Assistance?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Our medical equipment specialists are here to help",
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _callSupport(context);
                },
                icon: Icon(Icons.phone),
                label: Text("Call Support"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.chat_bubble_outline),
                label: Text("WhatsApp Chat"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
