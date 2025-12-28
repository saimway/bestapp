import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/services/storage_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.watch(storageServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildSectionHeader(context, 'Appearance'),
          _buildSwitchTile(
            context,
            'Dark Mode',
            storage.isDarkMode,
            (val) {
              // Toggle theme logic would go here
              // For now we just update storage
              storage.setDarkMode(val);
            },
            LucideIcons.moon,
          ),
          const SizedBox(height: 16),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(LucideIcons.palette, color: Theme.of(context).primaryColor),
            ),
            title: const Text('Accent Color', style: TextStyle(fontWeight: FontWeight.w600)),
            trailing: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 12,
            ),
            onTap: () {
              // Open Color Picker
            },
          ),

          const SizedBox(height: 32),
          _buildSectionHeader(context, 'Audio'),
          _buildSwitchTile(
            context,
            'High Quality Audio',
            storage.isHighQualityAudio,
            (val) => storage.setHighQualityAudio(val),
            LucideIcons.music,
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Crossfade Duration', style: TextStyle(fontWeight: FontWeight.w600)),
              Slider(
                value: 5,
                min: 0,
                max: 12,
                label: '5s',
                onChanged: (val) {},
              ),
            ],
          ),

          const SizedBox(height: 32),
          _buildSectionHeader(context, 'General'),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(LucideIcons.timer, color: Colors.orange),
            ),
            title: const Text('Sleep Timer', style: TextStyle(fontWeight: FontWeight.w600)),
            trailing: const Icon(LucideIcons.chevronRight),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context,
    String title,
    bool value,
    Function(bool) onChanged,
    IconData icon,
  ) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      secondary: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Theme.of(context).primaryColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
    );
  }
}
