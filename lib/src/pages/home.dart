import 'package:flutter/material.dart';

import 'package:flutteravanzado1/src/models/band.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: "1", name: "Metallica", votes: 5),
    Band(id: "2", name: "Queen", votes: 1),
    Band(id: "3", name: "Héroes del Silencio", votes: 2),
    Band(id: "4", name: "Bon Jovi", votes: 5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("BandNames",style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) => _bandTile(bands[index])
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewBand
      ),
    );
  }

  Widget _bandTile(Band band){
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: EdgeInsets.only(left: 8),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("Delete Band", style: TextStyle(color: Colors.white),),
        )
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0,2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text("${band.votes}",style: TextStyle(fontSize: 20)),
        onTap: (){
          
        },
      ),
    );
  }

  addNewBand() {

    final textController = new TextEditingController();

    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title:Text("New band name: "),
          content: TextField(
            controller: textController,
          ),
          actions: [
            MaterialButton(
              child: Text("Add"),
              textColor: Colors.blue,
              elevation: 5,
              onPressed: () => addBandToList(textController.text)
            )
          ],
        );
      },
    );
  }

  void addBandToList(String name) {

    if(name.length > 1) {
      this.bands.add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
    }

    setState(() {
      
    });

    Navigator.pop(context);

  }
}