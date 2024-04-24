import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naybeyes/main%20screens/full_screen_img.dart';
import 'package:naybeyes/screens/doctor/profile/add_new_post.dart';

// Import UserProvider and Provider package
import 'package:naybeyes/user_provider.dart';
import 'package:naybeyes/screens/doctor/profile/doctor_post_template.dart';
import 'package:provider/provider.dart';

class DoctorProfilePage extends StatefulWidget {
  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  late String currentUserUid;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUserUid();
  }

  Future<void> getCurrentUserUid() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserUid = user.uid;
      });
    }
  }

  void _signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacementNamed(context, '/doctor/login');
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewPostPage()),
          );
        },
        label: Text(
          'New Post',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.post_add, color: Colors.white),
        backgroundColor: Color(0xFF199A8E),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final userData = userProvider.userData;

          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: userData != null
                    ? _buildProfile(userData)
                    : Center(child: CircularProgressIndicator()),
              ),
              SliverToBoxAdapter(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('DoctorPosts')
                      .where('doctorUID', isEqualTo: currentUserUid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.data == null ||
                        snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No posts found'));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          DocumentSnapshot post = snapshot.data!.docs[index];
                          String doctorUID = post['doctorUID'];

                          return FutureBuilder<DocumentSnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('Doctors')
                                .doc(doctorUID)
                                .get(),
                            builder: (context,
                                AsyncSnapshot<DocumentSnapshot>
                                    doctorSnapshot) {
                              if (doctorSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (doctorSnapshot.hasError) {
                                return Text(
                                    'Error: ${doctorSnapshot.error}');
                              } else {
                                var doctorData =
                                    doctorSnapshot.data!.data() as Map<String,
                                        dynamic>;

                                return DoctorPostTemplate(
                                  doctorAvatar: doctorData['avatar'] ?? '',
                                  doctorName:
                                      '${doctorData['firstName']} ${doctorData['lastName']}',
                                  postDate: post['date'] ?? '',
                                  postTime: post['time'] ?? '',
                                  postContent: post['content'] ?? '',
                                  postImage: post['imageUrl'] ?? null,
                                );
                              }
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfile(Map<String, dynamic>? userData) {
    final avatar = userData!['avatar'] ?? '';
    final firstName = userData['firstName'] ?? '';
    final lastName = userData['lastName'] ?? '';
    final fullName = '$firstName $lastName';
    final email = userData['email'] ?? '';
    final phone = userData['phoneNumber'] ?? '';
    final specialization = userData['specialization'] ?? '';
    final birthplace = userData['birthplace'] ?? '';
    final birthdate = userData['birthdate'] ?? '';

    int _calculateAge(String birthdate) {
      DateTime today = DateTime.now();
      DateTime birthDate = DateTime.parse(birthdate);
      int age = today.year - birthDate.year;
      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age;
    }

    int age = _calculateAge(birthdate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImage(imageUrl: avatar),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 390,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(userData['avatar']),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 8),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. $fullName',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF199A8E),
                ),
              ),
              SizedBox(height: 10),
              Text(
                '• $specialization',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF199A8E),
                ),
              ),
              SizedBox(height: 5),
              Text(
                '• Age $age',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF199A8E),
                ),
              ),
              SizedBox(height: 5),
              Text(
                '• $birthplace',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF199A8E),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 8),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF199A8E),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Color(0xFF199A8E),
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '$phone',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF199A8E),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Color(0xFF199A8E),
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '$email',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF199A8E),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () => _signOut(context),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.exit_to_app,
                  color: Color(0xFF199A8E),
                ),
                SizedBox(width: 5),
                Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}

