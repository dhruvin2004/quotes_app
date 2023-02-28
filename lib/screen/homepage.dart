import 'dart:math';
import 'package:flutter/material.dart';
import '../global.dart';
import '../image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Set<String> categories =
        Set<String>.from(list.map((item) => item['Category']));
    uniqueList = categories.map((category) => {'Category': category}).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          "Life Quotes and Sayings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.yellow,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          // SizedBox(
          //   height: 230,
          //   child: CarouselSlider(
          //     options: CarouselOptions(height: 400.0),
          //     items: [ ListView.builder(itemCount: uniqueList.length,itemBuilder: (context,index) =>list[index]['Slider'],)].map((i) {
          //       return Builder(
          //         builder: (BuildContext context) {
          //           return Container(
          //               width: MediaQuery.of(context).size.width,
          //               margin: EdgeInsets.symmetric(horizontal: 5.0),
          //               decoration: BoxDecoration(
          //                 image: DecorationImage(image: NetworkImage(i.toString())),
          //
          //               ),
          //
          //           );
          //         },
          //       );
          //     }).toList(),
          //   ),
          // ),

          SizedBox(
            height: 230,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: uniqueList.length,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height / 4.5,
                            width: MediaQuery.of(context).size.width / 1.05,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        list[index]['Slider'].toString()),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ],
                      ),
                    )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ImagePage()));
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                    Text("Pic Quotes")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Category()));
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.grid_view,
                        color: Colors.white,
                      ),
                    ),
                    Text("Categories")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuotesList()));
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.watch_later,
                        color: Colors.white,
                      ),
                    ),
                    Text("Latest Quotes")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ImagePage()));
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                    Text("Favourite")
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Latest Quotes",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 220,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            HSLColor.fromAHSL(
                                    1.0, Random().nextDouble() * 360, 0.5, 0.8)
                                .toColor(),
                            HSLColor.fromAHSL(
                                    1.0, Random().nextDouble() * 360, 0.5, 0.8)
                                .toColor()
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          list[index]['Quote'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuotesList extends StatefulWidget {
  const QuotesList({Key? key}) : super(key: key);

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Latest Quotes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 220,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        HSLColor.fromAHSL(
                                1.0, Random().nextDouble() * 360, 0.5, 0.8)
                            .toColor(),
                        HSLColor.fromAHSL(
                                1.0, Random().nextDouble() * 360, 0.5, 0.8)
                            .toColor()
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      list[index]['Quote'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
