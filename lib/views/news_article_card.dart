import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';

class NewsArticleCard extends StatelessWidget {
  NewsArticleCard({Key? key, required this.article}) : super(key: key);
  Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            child: Image(image: NetworkImage(article.urlToImage!),)
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(20.0),
            //   image: DecorationImage(
            //     image: NetworkImage("https://picsum.photos/250?image=9"),
            //     fit: BoxFit.fill,
            //   ),
            // ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            article.title!,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            article.description!,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
