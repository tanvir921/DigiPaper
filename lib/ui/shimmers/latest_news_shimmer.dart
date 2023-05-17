import 'package:digipaper/responsive/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsLayoutShimmer extends StatefulWidget {
  const NewsLayoutShimmer({Key? key}) : super(key: key);

  @override
  State<NewsLayoutShimmer> createState() => _NewsLayoutShimmerState();
}

class _NewsLayoutShimmerState extends State<NewsLayoutShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemBuilder: (_, __) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: 40.0,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                            ),
                        Container(
                          height: 25,
                          width: 50,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: Colors.white,
                          ),

                        ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                itemCount: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
