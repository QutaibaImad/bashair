// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:bashair_project/admin/edit_order_detail_screen.dart';
import 'package:bashair_project/admin/nest_family_screen.dart';
import 'package:bashair_project/admin/order_detail_screen.dart';
import 'package:bashair_project/audio/audio_page.dart';
import 'package:bashair_project/firebase_options.dart';
import 'package:bashair_project/provider/cart.dart';
import 'package:bashair_project/screens/add_family_member_screen.dart';
import 'package:bashair_project/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        title: 'البشائر هويتنا',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', 'AE'),
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: WelcomeScreen(),
        routes: {
          'order-detail-screen': (context) => OrderDetailScreen(),
          'edit-order-detail-screen': (context) => EditOrderDetailScreen(),
          // 'nest-family-screen': (context) => NestFamilyScreen(
          //       categoryId: FirebaseAuth.instance.currentUser!.uid,
          //     ),
          'add-family-member-screen': (context) => AddFamilyMemberScreen(),
        },
      ),
    );
  }
}
