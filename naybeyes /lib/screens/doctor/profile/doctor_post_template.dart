import 'package:flutter/material.dart';
import 'package:naybeyes/main%20screens/full_screen_img.dart';

class DoctorPostTemplate extends StatelessWidget {
  final String doctorAvatar;
  final String doctorName;
  final String postDate;
  final String postTime;
  final String postContent;
  final String? postImage;

  DoctorPostTemplate({
    required this.doctorAvatar,
    required this.doctorName,
    required this.postDate,
    required this.postTime,
    required this.postContent,
    this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor Avatar, Name, and Date
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(doctorAvatar),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    postDate,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          // Post Content
          Text(
            postContent,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 12),
          // Post Image
          if (postImage != null)
            GestureDetector(
              onTap: () {
                // Navigate to full-screen image when post image is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(imageUrl: postImage!),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 200, 
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(postImage!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
