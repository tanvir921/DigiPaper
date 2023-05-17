import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digipaper/models/latest_news_model.dart';
import 'package:digipaper/responsive/mediaquery.dart';
import 'package:digipaper/ui/screens/detail_view.dart';
import 'package:digipaper/utils/api_call.dart';
import 'package:digipaper/utils/app_constraints.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:shimmer/shimmer.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with AutomaticKeepAliveClientMixin<CustomSlider>{

  @override
  bool get wantKeepAlive => true;



  List<Results>? filteredList;

  @override
  void initState() {
    super.initState();
    fetchNews();
    fetchNewsWithWithoutImg();
  }

  Future<void> fetchNews() async {
    final latestNews = await ApiCall.apicall();
    if (latestNews != null) {
      setState(() {
        filteredList = latestNews.results
            ?.where((result) => result.imageUrl != null)
            .take(3)
            .toList();
      });
    }
  }

  Future<void> fetchNewsWithWithoutImg() async {
    final latestNews1 = await ApiCall.apicall();
    if (latestNews1.status=='success') {
      setState(() {
        filteredList = latestNews1.results
            ?.where((result) => result.imageUrl != null)
            .take(3)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
      child: Container(
        color: Colors.amber,
        height: context.height * .5,
        width: context.width,
        child: filteredList != null
            ? CarouselSlider.builder(
          key: PageStorageKey<String>('carousel_slider'),
          itemCount: 3,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            final result = filteredList![itemIndex];
            return Container(
              color: itemIndex % 2 == 0 ? Colors.red : Colors.blue,
              child: Container(
                height: context.height * .5,
                width: context.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(result.imageUrl!),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        width: 135,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Colors.white.withOpacity(0.45),
                        ),
                        child: const Center(
                          child: Text(
                            'News of the day',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        HtmlUnescape().convert(

                          result.title!.length > 60
                              ? '${result.title!.substring(0, 60)}...'
                              : result.title!
                        ),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>DetailView(title: result.title.toString(), time: result.pubDate.toString(), imageUrl: result.imageUrl.toString(),detailNews: result.content.toString(), newsLink: result.link.toString(),)));
                        },
                        child: Row(
                          children: const [
                            Text(
                              'Learn More',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            height: context.height * .5,
          ),
        )
            : Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.white,
            height: context.height * .5,
            width: context.width,
          ),
        ),
      ),
    );
  }
}
