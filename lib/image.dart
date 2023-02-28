import 'dart:math';

import 'package:flutter/material.dart';

import 'global.dart';
import 'list.dart';


class ImagePage extends StatefulWidget {
  const ImagePage({
    super.key,
  });

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: const Text('Pic Quotes'),

      ),

     body:  ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => (list[index]['Image'] != null)
          ? Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Container(

                alignment: Alignment.center,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                        list[index]['Image'],
                      ),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    list[index]['Quote'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          : Container(),
    ),
      backgroundColor: Colors.white,
    );
  }
}



class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 3.2,
        children: List.generate(
          uniqueList.length,
              (index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListPage(
                          index: index,
                          category: uniqueList[index]['Category'],
                        ),
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
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
                    color: Colors.primaries[
                    Random().nextInt(Colors.primaries.length)],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    (uniqueList[index]['Category']),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}


