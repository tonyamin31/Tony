import 'package:flutter/material.dart';

import 'package:naybeyes/drop_down_lists/medicalrecordtypes.dart';
import 'package:naybeyes/screens/patient/records/add_new_record.dart';
import 'package:naybeyes/screens/patient/records/record_items.dart';

class RecordsPage extends StatefulWidget {
  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Records'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to AddNewRecordPage (implementation required)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewRecordPage(), // Replace with your page
            ),
          );
        },
        label: Text(
          'Add New Record',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF199A8E),
      ),
      body: ListView.builder(
        itemCount: recordTypes.length,
        itemBuilder: (context, index) {
          final recordType = recordTypes[index];
          return GestureDetector(
            onTap: () => _navigateToRecordList(recordType.name, recordType.collectionPath),
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  recordType.name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF199A8E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0xFF199A8E),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToRecordList(String name, String collectionPath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordList(name: name, collectionPath: collectionPath),
      ),
    );
  }
}
