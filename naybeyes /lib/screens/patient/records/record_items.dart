import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naybeyes/screens/patient/records/record_card.dart';
import 'package:naybeyes/screens/patient/records/record_details.dart'; // Import RecordDetailPage

class RecordList extends StatefulWidget {
  final String name;
  final String collectionPath;

  const RecordList({required this.collectionPath, required this.name});

  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  Stream<QuerySnapshot>? recordStream;

  @override
  void initState() {
    super.initState();
    recordStream = FirebaseFirestore.instance
        .collection(widget.collectionPath)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: recordStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final record = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  // Build a widget representing the medical record
                  return GestureDetector(
                    onTap: () {
                      // Navigate to RecordDetailPage when record is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecordDetailPage(record: record),
                        ),
                      );
                    },
                    child: RecordCard(record: record),
                  );
                },
              );
          }
        },
      ),
    );
  }
}

