// Flutter Frontend for Campus Connect - Enhanced UI with Modern Design Elements

import 'package:campus/screens/ask_your_crush.dart';
import 'package:campus/screens/campus_cupid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(CampusConnectApp());
}

class CampusConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Connect',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = 450;
        return Center(
          child: SizedBox(
            width: constraints.maxWidth > maxWidth ? maxWidth : constraints.maxWidth,
            height: 800,
            child: Scaffold(
              backgroundColor: Colors.grey[100],
              appBar: AppBar(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    badge.Badge(
                      badgeContent: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("3", style: TextStyle(color: Colors.white)),
                      ),
                      badgeStyle: badge.BadgeStyle(badgeColor: Colors.redAccent.shade200),
                      position: badge.BadgePosition.topEnd(top: -16, end: -14),
                      child: Row(
                        children: [
                          Icon(Icons.insert_comment_outlined, color: Colors.white),
                          SizedBox(width: 10),
                          Text('Requests', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    badge.Badge(
                      badgeContent: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("1", style: TextStyle(color: Colors.white)),
                      ),
                      badgeStyle: badge.BadgeStyle(badgeColor: Colors.redAccent.shade200),
                      position: badge.BadgePosition.topStart(top: -16, start: -14),
                      child: Row(
                        children: [
                          Text('Matches', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Icon(Icons.favorite_border, color: Colors.white),
                        ],
                      ),
                    )
                  ],
                ),
                backgroundColor: Colors.red[800],
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red[800],
                              radius: 41,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                radius: 40,
                                child: Icon(Icons.person, color: Colors.red[800], size: 40),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: EdgeInsets.all(7.5),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.red[800],
                                ),
                                child: Icon(Icons.camera_alt, color: Colors.grey[200], size: 15),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ashish Nath", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text("IMT Ghaziabad", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("This is Ashish !")));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colors.red[800],
                            foregroundColor: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Text('Edit', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 5),
                              Icon(Icons.edit, color: Colors.white,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CampusCupidPage()),
                                  );
                                },
                                child: DashboardTile(title: 'CampusCupid', icon: CupertinoIcons.heart_fill, description: "Matchmaking for your campus and other campuses.")),
                            GestureDetector(
                                 onTap: (){
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => AskYourCrushPage()),
                                   );
                                 },
                                child: DashboardTile(title: 'AskYourCrush', icon: CupertinoIcons.text_bubble_fill, description: "Find out if your crush likes you back - ANONYMOUSLY!")),
                            DashboardTile(title: 'Tingle', icon: CupertinoIcons.camera_fill, description: "5-minute speed dating on video calls."),
                            DashboardTile(title: 'BeReal', icon: CupertinoIcons.hand_point_right_fill, description: "A Reddit-style anonymous discussion board for campus."),
                          ].animate(interval: 300.ms, effects: [FadeEffect(duration: 500.ms)]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.grey[100],
                  selectedItemColor: Colors.red[800],
                  unselectedItemColor: Colors.grey,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.send),
                      label: 'Confess',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.people),
                      label: 'Explore',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DashboardTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  DashboardTile({required this.title, required this.icon, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 40,
              child:  Icon(icon, color: Colors.red[800], size: 40), // Change as needed
            ),
            // Icon(icon, color: Colors.red[800], size: 40),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  Center(child: CircleAvatar(backgroundColor: Colors.grey[200],radius: 10,child: Icon(Icons.arrow_downward_outlined,color: Colors.grey[700],size: 10,),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



