
import 'package:flutter/material.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widgets/layout.dart';

import '../model/newsModel.dart';

class News_App extends StatefulWidget {
  const News_App({super.key});

  @override
  State<News_App> createState() => _NewsAppState();
}

class _NewsAppState extends State<News_App> {
  NewsService service = NewsService();
  List<News> news = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Future<List<News>> future = service.getProducts();
    future.then((List<News> news) {
      this.news= news;
      setState(() {
      });
    }).catchError((err) => print("Error is $err"));
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: const [
            Text(
              "Khabhar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "AAJ KI",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 189, 184, 184),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5,right: 5,top: 5),
              decoration: BoxDecoration(
        
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
                
              ),
            child: 
            const TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                
                prefixIcon: Icon(Icons.search),
                hintText: "Search here"
              ),
            ),
            ),
          const Divider(
            height: 5,color:Colors.grey ,
          ),
      
           Wrap(
             children: news.map((e) => Item(title: e.title, imageUrl: e.imageUrl, description: e.description)).toList(),
             ),
          
          ],
           ),
          ), 
      
    );
  }
}