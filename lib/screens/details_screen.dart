// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation, unused_element, avoid_print, unused_import

import 'package:bashair_project/get_data/get_profile_data.dart';
import 'package:bashair_project/widgets/detail_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final credential = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetProfileData(
        documentId: credential!.uid,
      ),
    );
  }
}
