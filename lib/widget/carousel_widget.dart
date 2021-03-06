import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newsapp/model/model.dart';
import 'package:flutter_newsapp/utils/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;
  const CarouselWidget({Key? key, required this.articleList}) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imageSlider;
  
  @override
  void initState() {
    imageSlider = widget.articleList.map((article) => 
    Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(article.urlToImage),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.1, 0.9],
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.white.withOpacity(0.1)
                ]
              )
            ),
          ),
          Positioned(
              bottom: 30, 
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.title, style: titleArticleHeadline.copyWith(fontSize: 12),),
                    SizedBox(height: 10,),
                    Text(article.author, style: authorDateArticle.copyWith(fontSize: 10),),
                  ],
                ),
              ))
        ],
      ),
    ),
    ).toList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: imageSlider, options: CarouselOptions(autoPlay: true, viewportFraction: 1));
  }
}