import 'package:flutter/material.dart';
import 'package:naybeyes/main%20screens/full_screen_img.dart';
import 'package:intl/intl.dart';

class RecordDetailPage extends StatelessWidget {
  final Map<String, dynamic> record;

  const RecordDetailPage({super.key, required this.record});
  
  
  @override
  Widget build(BuildContext context) {

    final timestamp = record['timestamp']?.toDate();
    final formattedDate = timestamp != null ? DateFormat.yMMMd().format(timestamp) : 'N/A';
    final imageUrl = record['imageUrl'] ?? 'N/A';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                formattedDate,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
        
              Text(
                '${record['title'] ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
        
              Text(
                'Description\n${record['description'] ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
        
              
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(imageUrl: imageUrl),
                    ),
                  );
                },
                child: imageUrl != 'N/A'
                ? Image.network(
                    imageUrl,
                    // width: 400, // Adjust image width as needed
                    // height: 400, // Adjust image height as needed
                    fit: BoxFit.cover, // Adjust image fit (optional)
                  )
                : const Text('No image available'),
              ),

          
              const SizedBox(height: 10),
        
              
        
              // Add more details as needed
            ],
          ),
        ),
      ),
    );
  }
}





