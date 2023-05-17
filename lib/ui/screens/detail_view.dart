import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {

  const DetailView({Key? key, required this.title, required this.imageUrl, required this.detailNews, required this.time, required this.newsLink}) : super(key: key);

  final String title;
  final String imageUrl;
  final String detailNews;
  final String time;
  final String newsLink;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){Navigator.of(context).pop();}
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: widget.imageUrl=='null'? false:true,
                  child: Image.network(widget.imageUrl)),
              SizedBox(
                height: 5,
              ),
              Text(widget.title),
              SizedBox(
                height: 5,
              ),
              Text(widget.time),
              SizedBox(
                height: 5,
              ),
              Text(widget.detailNews),
              SizedBox(
                height: 5,
              ),
              TextButton(onPressed: (){}, child: Text(widget.newsLink)),
            ],
          ),
        ),
      ),
    );
  }
}
