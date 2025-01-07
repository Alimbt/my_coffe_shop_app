import 'package:coffee_shop/classes/custombarchart.dart';

import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 71, 71),
      appBar: AppBar(
        title: const Text(
          'dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 150, 124, 115),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'today sells',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.right,
              'last update 2022-02-02',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 179, 145, 135),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 236, 234, 234).withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(8.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'total sales number today: 10',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'sales amount today: 1000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'total sells this week',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const CustomBarChart(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'monthly report',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 150, 124, 115),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 236, 234, 234)
                        .withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                //i u want to not scrool ur list add this line
                // physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    tileColor: Color.fromARGB(255, 150, 124, 115),
                    title: Text('foods'),
                    subtitle: Text('10 sells '),
                  ),
                  Divider(color: Colors.black, thickness: 1.0),
                  ListTile(
                    tileColor: Color.fromARGB(255, 150, 124, 115),
                    title: Text('drinks'),
                    subtitle: Text('10 sells '),
                  ),
                  Divider(color: Colors.black, thickness: 1.0),
                  ListTile(
                    tileColor: Color.fromARGB(255, 150, 124, 115),
                    title: Text('total'),
                    subtitle: Text('20 sells'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 179, 145, 135),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              duration: Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 95, 69, 60),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('dashboard'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AdminDashboard();
                }));
              },
            ),
            ListTile(
              title: const Text('manage Coffees'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('manage Foods'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('manage customers'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('manage orders'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
