import 'package:flutter/material.dart';
import 'package:naybeyes/screens/patient/search/doctors_list.dart';
import 'package:naybeyes/screens/patient/search/find_doctor.dart';
import 'package:naybeyes/widgets/specialization_name.dart';
import 'package:naybeyes/drop_down_lists/specializations.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> specializations = specializationsList;
  TextEditingController _specializationSearchController = TextEditingController();
  List<String> filteredSpecializations = [];

  @override
  void initState() {
    super.initState();
    _specializationSearchController = TextEditingController();
    filteredSpecializations = specializations;
  }

  @override
  void dispose() {
    _specializationSearchController.dispose();
    super.dispose();
  }

  void searchSpecializations(String query) {
    setState(() {
      filteredSpecializations = specializations
          .where((specialization) =>
              specialization.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Specializations'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(Icons.search), // Add search icon
                      SizedBox(width: 15), // Add some space between icon and text
                      Expanded(
                        child: TextField(
                          controller: _specializationSearchController,
                          onChanged: (value) {
                            searchSpecializations(value.trim());
                          },
                          decoration: InputDecoration(
                            hintText: 'Search for a specialization',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the search page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FindDoctorPage(),
                    ),
                  );
               },
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(Icons.search), // Add search icon
                        SizedBox(width: 15), // Add some space between icon and text
                        Expanded(
                          child: IgnorePointer(
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Find a doctor',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredSpecializations.length,
                itemBuilder: (context, index) {
                  String specialization = filteredSpecializations[index];
                  return SpecializationName(
                    specialization: specialization,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorListPage(specialization),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
