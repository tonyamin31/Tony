
import 'package:Asahby/widget/appbarwithback.dart';
import 'package:flutter/material.dart';

import '../player.dart';

class DashboardPage extends StatefulWidget {
  final List<Player> players;

  DashboardPage({required this.players});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            backTop_Of_Page(),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Color.fromARGB(255, 251, 167, 42),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 200,
                child: ListView.builder(
                  itemCount: widget.players.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.players[index].name,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 251, 167, 42),
                                      fontSize: 25),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 51, 38, 117),
                                        borderRadius: BorderRadius.circular(
                                            8), // Rounded corners
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.remove,
                                            color: Colors.white),
                                        onPressed: () {
                                          setState(() {
                                            if (widget.players[index].score >
                                                0) {
                                              widget.players[index].score--;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            8), // Add some space between the buttons
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(
                                            8), // Rounded corners
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.add,
                                            color: Colors.white),
                                        onPressed: () {
                                          setState(() {
                                            widget.players[index].score++;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Score: ${widget.players[index].score}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
