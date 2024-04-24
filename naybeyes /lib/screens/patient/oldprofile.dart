import 'package:flutter/material.dart';

// Import UserProvider and Provider package
import 'package:naybeyes/user_provider.dart';
import 'package:provider/provider.dart';

class PatientProfilePage extends StatefulWidget {
  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  int _selectedIndex = 0; // Current selected tab index
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final userData = userProvider.userData;

          if (userData != null) {
          final firstName = userData['firstName'] ?? '';
          final lastName = userData['lastName'] ?? '';
          final fullName = '$firstName$lastName'; // Concatenating first name and last name
          
          return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(userData['avatar']),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF199A8E), // Border color
                          width: 2, // Border width
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    fullName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Add horizontally scrollable TabBar here
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0), // Adjust the horizontal margin as needed
                      child: Row(
                        children: [
                          _buildTab('Personal Info', 0),
                          _buildTab('Allergies', 1),
                          _buildTab('Surgeries', 2),
                          _buildTab('Chronic Diseases', 3),
                          _buildTab('Other', 4),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: IndexedStack(
                      index: _selectedIndex,
                      children: [
                        // Content for Personal Info tab
                        Center(
                          child: Text(
                            'Personal Info Content',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // Content for Allergies tab
                        Center(
                          child: Text(
                            'Allergies Content',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // Content for Surgeries tab
                        Center(
                          child: Text(
                            'Surgeries Content',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // Content for Chronic Diseases tab
                        Center(
                          child: Text(
                            'Chronic Diseases Content',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // Content for Other tab
                        Center(
                          child: Text(
                            'Other Content',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          } 
        }, // builder
      ), // Consumer
    );
  }

  Widget _buildTab(String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5), // Add horizontal padding
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index; // Update selected tab index
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
          decoration: BoxDecoration(
            color: _selectedIndex == index ? Color(0xFF199A8E) : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: _selectedIndex == index ? Colors.transparent : Color(0xFF199A8E),
              width: 2, // Border width
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.white : Color(0xFF199A8E),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
