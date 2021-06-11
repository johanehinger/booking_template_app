import 'package:flutter/material.dart';

class ContentDrawer extends StatelessWidget {
  final Function onItemTapped;
  const ContentDrawer({required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.only(
            left: 24,
            top: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () => onItemTapped(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.home_filled),
                          SizedBox(
                            width: 24,
                          ),
                          const Text("Home"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextButton(
                      onPressed: () => onItemTapped(1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.event_available_rounded),
                          SizedBox(
                            width: 24,
                          ),
                          const Text("Book"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextButton(
                      onPressed: () => onItemTapped(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.account_box),
                          SizedBox(
                            width: 24,
                          ),
                          const Text("Account"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(Icons.info_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
