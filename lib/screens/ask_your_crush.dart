import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class AskYourCrushPage extends StatefulWidget {
  @override
  _AskYourCrushPageState createState() => _AskYourCrushPageState();
}

class _AskYourCrushPageState extends State<AskYourCrushPage> {
  List<String> crushes = ['', '', ''];
  List<String> allNames = ["Alice", "Bob", "Charlie", "David", "Emma", "Sophia", "Liam", "Noah"];
  String searchQuery = "";
  List<String> filteredNames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ask Your Crush", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red[800],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth > 450 ? 450 : constraints.maxWidth;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgthree.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: maxWidth,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Search and Add Your Crush",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(color: Colors.red[800]),
                          labelText: "Search for a name",
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.grey)
                          ),
                          disabledBorder : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.grey)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red)
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                            filteredNames = allNames
                                .where((name) => name.toLowerCase().contains(searchQuery.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      if (searchQuery.isNotEmpty && filteredNames.isNotEmpty)
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView(
                            children: filteredNames
                                .map((name) => ListTile(
                              title: Text(name),
                              onTap: () {
                                setState(() {
                                  for (int i = 0; i < crushes.length; i++) {
                                    if (crushes[i].isEmpty) {
                                      crushes[i] = name;
                                      break;
                                    }
                                  }
                                  searchQuery = "";
                                  filteredNames.clear();
                                });
                              },
                            ))
                                .toList(),
                          ),
                        ),
                      SizedBox(height: 10),
                      Column(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              readOnly: true,
                              controller: TextEditingController(text: crushes[index]),
                              decoration: InputDecoration(
                                floatingLabelStyle: TextStyle(color: Colors.red[800]),
                                labelText: "Add ${["first", "second", "third"][index]} crush",
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Colors.grey)
                                ),
                                disabledBorder : OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Colors.grey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Colors.red)
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Note that names cannot be changed for 1 month",
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),
                    ].animate(interval: 300.ms, effects: [FadeEffect(duration: 500.ms)]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
