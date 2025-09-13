import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotzmann_app/features/booking/booking_screen.dart';
import 'package:gotzmann_app/features/home/home_screen.dart';
import 'package:gotzmann_app/features/instagram/instagram_screen.dart';
import 'package:gotzmann_app/features/legal_contact/agb_screen.dart';
import 'package:gotzmann_app/features/legal_contact/legal_contact_screen.dart';
import 'package:gotzmann_app/features/settings/membership_screen.dart';
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
                    icon: Icon(Icons.school), label: 'Workshops'),
                NavigationDestination(
                    icon: Icon(Icons.book_online), label: 'Buchen'),
                NavigationDestination(
                    icon: Icon(Icons.camera_alt), label: 'Instagram'),
                NavigationDestination(
                    icon: Icon(Icons.info), label: 'Rechtliches'),
                NavigationDestination(
                    icon: Icon(Icons.settings), label: 'Einstellungen'),
              ],
              onDestinationSelected: (index) {
                switch (index) {
                  case 0:
                    context.go('/');
                    break;
                  case 1:
                    context.go('/workshops');
                    break;
                  case 2:
                    context.go('/booking');
                    break;
                  case 3:
                    context.go('/instagram');
                    break;
                  case 4:
                    context.go('/legal');
                    break;
                  case 5:
                    context.go('/settings');
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
          GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
              routes: [
                GoRoute(
                  path: 'membership',
                  name: 'membership',
                  builder: (context, state) => const MembershipScreen(),
                ),
              ]),
        ],
      ),
    ],
  );
}

int _calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).uri.toString();
  if (location == '/') return 0;
  if (location.startsWith('/workshops')) return 1;
  if (location.startsWith('/booking')) return 2;
  if (location.startsWith('/instagram')) return 3;
  if (location.startsWith('/legal')) return 4;
  if (location.startsWith('/settings')) return 5;
  return 0;
}
