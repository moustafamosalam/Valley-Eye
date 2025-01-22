import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_towers/BackEnd/UsedParam.dart';
import 'package:weather_towers/Towers/StatesTowers.dart';
import 'package:weather_towers/Towers/tower_card.dart';

class DataFetch extends ChangeNotifier{
  dynamic temperature;
  dynamic humidity;
  dynamic precipitation;
  dynamic wind;
  dynamic uv;
  dynamic dust;
  dynamic current;

  late StreamSubscription<QuerySnapshot>? _subscription;

  Future<void> fetchStatesNames()async {
    CollectionReference<Map<String, dynamic>> collectionData = FirebaseFirestore.instance.collection('TowersData');
    try {
      // Fetch all documents in the collection
      QuerySnapshot<Map<String, dynamic>> snapshot = await collectionData.get();
      // Extract and print document IDs
      statesList = snapshot.docs.map((doc) => doc.id).toList();
      print(statesList);
    } catch (e) {
      print('Error fetching document names: $e');
    }
  }

  Future<void> fetchAllValleys(int selectedState, int selectedValleyType)async {
    CollectionReference<Map<String, dynamic>> availableTowers =
    FirebaseFirestore.instance.collection('TowersData').doc(statesList[selectedState]).collection(valleyTypeList[selectedValleyType]);
    try {
      // Fetch all documents in the collection
      QuerySnapshot<Map<String, dynamic>> snapshot = await availableTowers.get();

      if (snapshot.docs.isNotEmpty) {
        currentAvailableTowers = [];
        // Iterate through each document
        for (var doc in snapshot.docs) {
          Map<String, dynamic>? fields = doc.data();
          // Print the document ID and fields
          print('Document ID: ${doc.id}');
          print('Document Fields: $fields');
          currentAvailableTowers.add(
            TowerCard(
              title: doc.id,
              onlineStatus: fields["status"],
              thumbnailUrl: fields["thumbnail_url"],
              location: LatLng(fields["location"].latitude, fields["location"].longitude),
              numberOfTowers: fields["number_of_towers"],
            )
          );
        }
      } else {
        currentAvailableTowers = emptyState;
        print('No documents found in the collection!');
      }
    } catch (e) {
      print('Error fetching documents: $e');
    }
  }

  Future<void> fetchLatestParameter(String? tower) async {
    try {
      DocumentSnapshot? newestDocument;

      _subscription = FirebaseFirestore.instance.collection('TowersData').doc(statesList[stateNumber]).collection(valleyTypeList[valleyNumber]).doc(valley).collection(tower!).orderBy('Timestamp',descending: true).limit(1).snapshots().
        listen((snapshots) {
          if(snapshots.docs.isNotEmpty)
            {
              newestDocument = snapshots.docs.first;
              temperature = newestDocument!.get('Temp');
              humidity = newestDocument!.get('Hum');
              precipitation = newestDocument!.get('prec');
              wind = newestDocument!.get('wind');
              uv = newestDocument!.get('uv');
              dust = newestDocument!.get('dust');
              current = newestDocument!.get('current');
              notifyListeners();
            }
          else {
            temperature = null;
            humidity = null;
            precipitation = null;
            wind = null;
            uv = null;
            dust = null;
            current = null;
            notifyListeners();
          }
        });

    } catch (e) {
      print("Error fetching parameter: $e");
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

}