import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotzmann_app/features/booking/booking_screen.dart';
import 'package:gotzmann_app/features/gallery/gallery_screen.dart';
import 'package:gotzmann_app/features/home/home_screen.dart';
import 'package:gotzmann_app/features/instagram/instagram_screen.dart';
import 'package:gotzmann_app/features/legal_contact/agb_screen.dart';
import 'package:gotzmann_app/features/legal_contact/legal_contact_screen.dart';
import 'package:gotzmann_app/features/settings/settings_screen.dart';
import 'package:gotzmann_app/features/workshops/workshops_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter appRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              selectedIndex: _calculateSelectedIndex(context),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.photo_library), label: 'Galerie'),
                NavigationDestination(
                    icon: Icon(Icons.school), label: 'Workshops'),
                NavigationDestination(
                    icon: Icon(Icons.book_online), label: 'Buchen'),
                NavigationDestination(
                    icon: Icon(Icons.camera_alt), label: 'Instagram'),
                NavigationDestination(
                    icon: Icon(Icons.info), label: 'Kontakt/AGB'),
              ],
              onDestinationSelected: (index) {
                switch (index) {
                  case 0:
                    context.go('/');
                    break;
                  case 1:
                    context.go('/gallery');
                    break;
                  case 2:
                    context.go('/workshops');
                    break;
                  case 3:
                    context.go('/booking');
                    break;
                  case 4:
                    context.go('/instagram');
                    break;
                  case 5:
                    context.go('/legal');
                    break;
                }
              },
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/gallery',
            builder: (context, state) => const GalleryScreen(),
          ),
          GoRoute(
            path: '/workshops',
            builder: (context, state) => const WorkshopsScreen(),
          ),
          GoRoute(
            path: '/booking',
            builder: (context, state) => const BookingScreen(),
          ),
          GoRoute(
            path: '/instagram',
            builder: (context, state) => const InstagramScreen(),
          ),
          GoRoute(
            path: '/legal',
            builder: (context, state) => const LegalContactScreen(),
            routes: [
              GoRoute(
                path: 'agb',
                name: 'agb',
                builder: (context, state) => const AgbScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}

int _calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).uri.toString();
  if (location == '/') {
    return 0;
  }
  if (location == '/gallery') {
    return 1;
  }
  if (location == '/workshops') {
    return 2;
  }
  if (location == '/booking') {
    return 3;
  }
  if (location == '/instagram') {
    return 4;
  }
  if (location.startsWith('/legal')) {
    return 5;
  }
  return 0;
}
