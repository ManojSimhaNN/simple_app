// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'title': 'Apple',
      'description':
          'An apple is a round, edible fruit produced by an apple tree (Malus spp., among them the domestic or orchard apple; Malus domestica).'
    },
    {
      'title': 'Orange',
      'description':
          'The orange, also called sweet orange to distinguish it from the bitter orange (Citrus × aurantium), is the fruit of a tree in the family Rutaceae.'
    },
    {
      'title': 'Mango',
      'description':
          'A mango is an edible stone fruit produced by the tropical tree Mangifera indica.'
    },
    {
      'title': 'Banana',
      'description':
          'A banana is an elongated, edible fruit – botanically a berry[1] – produced by several kinds of large treelike herbaceous flowering plants in the genus Musa.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Fruit Store'),
        backgroundColor: Colors.lightBlue,
        leading: const Icon(Icons.shopping_cart),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "The available fruits are",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ListTile(
                      title: Center(
                        child: Text(items[index]['title']!),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              title: items[index]['title']!,
                              description: items[index]['description']!,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
