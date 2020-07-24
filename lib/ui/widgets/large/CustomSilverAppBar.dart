import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSilverAppBar extends StatefulWidget {
  @override
  _CustomSilverAppBarState createState() => _CustomSilverAppBarState();
}

class _CustomSilverAppBarState extends State<CustomSilverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Key::PageStorageKey("SilverAppBar"),
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Maroon,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RaisedButton(
            color: Colors.transparent,
            elevation: 0,
            onPressed: () {
              showSearch(context: context, delegate: ProductSearch());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  color: FakeWhite,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        FontAwesomeIcons.search,
                        color: Maroon,
                        size: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSearch extends SearchDelegate<String> {
  List<String> _suggestions = [" pasta", " maggie", " potato", "tomato"];
  List<String> _result = [
    " pasta",
    " maggie",
    " pasta",
    " maggie",
    " pasta",
    " salt",
    " potato",
    "tomato"
  ];

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? _suggestions : _result;
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                query = suggestions[index];
              },
              leading: Icon(
                FontAwesomeIcons.longArrowAltUp,
                color: LightBlack,
                size: 15,
              ),
              title: Padding(
                padding: EdgeInsets.all(8),
                child: Text(suggestions[index]),
              ),
            ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        color: Black,
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }
}
