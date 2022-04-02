import 'package:flutter/material.dart';
import 'package:news_app/api_services/api_servies.dart';
import 'package:news_app/model/news_model.dart';


import 'news_article_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Text(
              "Flutter",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        
      ),
      body: SafeArea(
        child: FutureBuilder<List<Article>?>(
          future: ApiServices().getNews(
            q: "tesla",
            from: "2022-03-01",
            sortBy: "publishedAt",
            apiKey: "19a79f8ad56a498192875ed7e713c10c",
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemBuilder: ((context, index) {
                  return NewsArticleCard(
                    article: snapshot.data![index],
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
