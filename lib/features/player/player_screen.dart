import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronDown),
          onPressed: () => context.pop(),
        ),
        title: const Text("Now Playing", style: TextStyle(fontSize: 16)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.moreHorizontal),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.3),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                // Album Art
                Container(
                  height: 320,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                        blurRadius: 40,
                        spreadRadius: 10,
                        offset: const Offset(0, 20),
                      ),
                    ],
                    image: const DecorationImage(
                      image: NetworkImage('https://picsum.photos/400'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),

                const SizedBox(height: 48),

                // Song Info
                Column(
                  children: [
                    Text(
                      "Awesome Track Title",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Famous Artist",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2),

                const SizedBox(height: 32),

                // Waveform / Progress Bar Placeholder
                Column(
                  children: [
                    // Mock Waveform
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(30, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            width: 4,
                            height: (index % 5 + 2) * 8.0,
                            decoration: BoxDecoration(
                              color: index < 15
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1:45", style: TextStyle(color: Colors.grey[400])),
                        Text("3:30", style: TextStyle(color: Colors.grey[400])),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(LucideIcons.shuffle),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
                    IconButton(
                      icon: const Icon(LucideIcons.skipBack, size: 32),
                      onPressed: () {},
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).primaryColor.withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(LucideIcons.play, size: 32, color: Colors.white),
                        onPressed: () {},
                      ),
                    ).animate().scale(delay: 500.ms),
                    IconButton(
                      icon: const Icon(LucideIcons.skipForward, size: 32),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(LucideIcons.repeat),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
                  ],
                ),

                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
