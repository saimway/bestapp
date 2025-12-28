import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 120), // Space for nav bar & mini player
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Header
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getGreeting(),
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                          ),
                    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
                    const SizedBox(height: 8),
                    Text(
                      "Let's catch the vibe today.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                          ),
                    ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
                  ],
                ),
              ),

              // Recently Played
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recently Played",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Icon(LucideIcons.history, size: 20, color: Theme.of(context).primaryColor),
                  ],
                ),
              ).animate().fadeIn(delay: 300.ms),

              const SizedBox(height: 16),

              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[800],
                              image: const DecorationImage(
                                image: NetworkImage('https://picsum.photos/200'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Song Title ${index + 1}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Artist Name",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey[400], fontSize: 12),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: (300 + (index * 100)).ms).slideX();
                  },
                ),
              ),

              const SizedBox(height: 32),

              // All Songs
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "All Songs",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ).animate().fadeIn(delay: 500.ms),

              const SizedBox(height: 16),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[800],
                        image: const DecorationImage(
                          image: NetworkImage('https://picsum.photos/100'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      "Track Number ${index + 1}",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "Artist • Album",
                      style: TextStyle(color: Colors.grey[400], fontSize: 13),
                    ),
                    trailing: IconButton(
                      icon: const Icon(LucideIcons.moreVertical, size: 20),
                      onPressed: () {},
                    ),
                    onTap: () {
                      context.push('/player');
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ).animate().fadeIn(delay: (500 + (index * 50)).ms).slideY(begin: 0.2, end: 0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
