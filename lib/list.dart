import 'dart:math';

import 'package:flutter/material.dart';
import 'global.dart';

class ListPage extends StatefulWidget {
  int index;
  String category;

  ListPage({super.key, required this.index, required this.category});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('List of ${widget.category}'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) =>
        (widget.category == list[index]['Category'])
            ? Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 246,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        HSLColor.fromAHSL(1.0,
                            Random().nextDouble() * 360, 0.5, 0.8)
                            .toColor(),
                        HSLColor.fromAHSL(1.0,
                            Random().nextDouble() * 360, 0.5, 0.8)
                            .toColor()
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      list[index]['Quote'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
            : Container(),
      ),
      backgroundColor: Colors.black,
    );
  }
}