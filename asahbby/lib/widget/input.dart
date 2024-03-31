import 'package:Asahby/widget/CardGame.dart';
import 'package:flutter/material.dart';

import '../player.dart';

class PlayerInput extends StatefulWidget {
  @override
  _PlayerInputState createState() => _PlayerInputState();
}

class _PlayerInputState extends State<PlayerInput> {
  List<Player> players = [];
  TextEditingController controller = TextEditingController();

  final InputDecoration _inputDecoration = const InputDecoration(
    labelText: 'Enter player name',
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFBAB2A)),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    labelStyle: TextStyle(color: Color(0xFFFBAB2A)),
    hintStyle: TextStyle(color: Color(0xFFFBAB2A)),
    suffixIcon: Icon(Icons.add),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 350,
          child: TextField(
            controller: controller,
            decoration: _inputDecoration,
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              // Handle text change if needed
            },
            onSubmitted: (value) {
              if (controller.text.isNotEmpty) {
                setState(() {
                  players.add(Player(name: controller.text));
                  controller.clear();
                });
              }
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 51, 38, 117), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 400, // Fixed height or adjust as needed
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  players[index].name,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      players.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: players.isNotEmpty
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardGame(players: players),
                    ),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 251, 167, 42),
            minimumSize: Size(200, 60),
            shape: RoundedRectangleBorder(
              side: players.isEmpty
                  ? BorderSide(
                      width: 1, color: Color.fromARGB(255, 51, 38, 117))
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Start Now',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color.fromARGB(255, 51, 38, 117),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}





























/*
class _PlayerInputState extends State<PlayerInput> {
  List<Player> players = [];
  TextEditingController controller = TextEditingController();

  final InputDecoration _inputDecoration = const InputDecoration(
    labelText: 'Enter player name',
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFBAB2A)),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    labelStyle: TextStyle(color: Color(0xFFFBAB2A)),
    hintStyle: TextStyle(color: Color(0xFFFBAB2A)),
    suffixIcon: Icon(Icons.add),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 350,
          child: TextField(
            controller: controller,
            decoration: _inputDecoration,
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              // Handle text change if needed
            },
            onSubmitted: (value) {
              if (controller.text.isNotEmpty) {
                setState(() {
                  players.add(Player(name: controller.text));
                  controller.clear();
                });
              }
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 51, 38, 117), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 400, // Fixed height or adjust as needed
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  players[index].name,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      players.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardGame(players: players),
                ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 251, 167, 42),
            minimumSize: Size(200, 60),
          ),
          child: const Text(
            'Start Now',
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Color.fromARGB(255, 51, 38, 117),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
*/