import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListNames extends StatefulWidget {
  const ListNames({super.key});

  @override
  _ListNamesState createState() => _ListNamesState();
}

class _ListNamesState extends State<ListNames> {
  List<String> names = [];
  List<int> counters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Names List'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Names')
            .doc('Baby_Names')
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          Map<String, dynamic>? data =
              snapshot.data?.data() as Map<String, dynamic>?;

          if (data == null || data.isEmpty) {
            return const Text('No names found');
          }

          names =
              List<String>.from(data.values.map((value) => value.toString()));

          // Initialize or update counters list
          if (counters.isEmpty) {
            counters = List<int>.filled(names.length, 0);
          } else {
            counters = counters.sublist(0, names.length);
            if (counters.length < names.length) {
              final remainingCounters =
                  List<int>.filled(names.length - counters.length, 0);
              counters.addAll(remainingCounters);
            }
          }

          return ListView.separated(
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    counters[index]++;
                  });

                  final collectionRef =
                      FirebaseFirestore.instance.collection('Counters');
                  final documentRef = collectionRef.doc(names[index]);

                  await documentRef.set({
                    'counter': counters[index],
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text(names[index]),
                    trailing: Text('${counters[index]}'),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 5,
            ),
          );
        },
      ),
    );
  }
}
