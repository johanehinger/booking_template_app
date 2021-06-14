import 'package:booking_template_app/design/theme_colors.dart';
import 'package:booking_template_app/services/news_service.dart';
import 'package:flutter/material.dart';

import '../widgets/news_post.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback setIndex;
  const HomeScreen({required this.setIndex});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    NewsService _newsService = new NewsService();

    return FutureBuilder(
      future: _newsService.getNewsPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<NewsPost>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("To booking"),
                              SizedBox(
                                width: 12.0,
                              ),
                              FloatingActionButton(
                                tooltip: "To booking",
                                onPressed: widget.setIndex,
                                child: Icon(Icons.event_available_rounded),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(snapshot.data!.toList()),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                ThemeColors.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
