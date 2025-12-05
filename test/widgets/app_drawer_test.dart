import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/widgets/app_drawer.dart';
import 'package:sandwich_shop/views/about_screen.dart';

void main() {
  group('AppDrawer Widget Tests', () {
    testWidgets('AppDrawer displays all menu items', (WidgetTester tester) async {
      // Arrange: Build the AppDrawer widget inside a MaterialApp
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      tooltip: 'Open navigation menu',
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    );
                  },
                ),
              ],
            ),
            endDrawer: const AppDrawer(),
          ),
        ),
      );

      // Act: Open the drawer
      final Finder drawerIcon = find.byTooltip('Open navigation menu');
      await tester.tap(drawerIcon);
      await tester.pumpAndSettle();

      // Assert: Verify all menu items are present
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('Navigates to Home when tapping Home in the drawer', (WidgetTester tester) async {
      // Arrange: Build the AboutScreen widget with mock navigation
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/about',
          routes: {
            '/': (context) => const Scaffold(body: Text('Home Screen')),
            '/about': (context) => const AboutScreen(),
          },
        ),
      );

      // Act: Open the drawer and tap "Home"
      final Finder drawerIcon = find.byTooltip('Open navigation menu');
      await tester.tap(drawerIcon);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      // Assert: Verify navigation to the home screen
      expect(find.text('Home Screen'), findsOneWidget);
    });
        testWidgets('Navigates to Profile when tapping Profile in the drawer', (WidgetTester tester) async {
      // Arrange: Build the AboutScreen widget with mock navigation
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/about',
          routes: {
            '/profile': (context) => const Scaffold(body: Text('Profile Screen')),
            '/about': (context) => const AboutScreen(),
          },
        ),
      );

      // Act: Open the drawer and tap "Profile"
      final Finder drawerIcon = find.byTooltip('Open navigation menu');
      await tester.tap(drawerIcon);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      // Assert: Verify navigation to the profile screen
      expect(find.text('Profile Screen'), findsOneWidget);
    });
  });
}