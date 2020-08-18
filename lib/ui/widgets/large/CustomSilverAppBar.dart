import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/screens/LaunchScreenWith/SearchResultsView.dart';
import 'package:bazar/util/loader/ProductLoadUtil.dart';
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

///////////////////////

//SEARCH PRODUCT

//////////////////////

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
  List<String> suggestions = [];

  @override
  Widget buildSuggestions(BuildContext context) {
//    final suggestions = query.isEmpty ? _suggestions : _result;
    if (query.isNotEmpty) {
      _getResults(context, query).then((value) {
        suggestions.clear();
        suggestions.addAll(value);
      });
    } else {
      suggestions.clear();
      suggestions.addAll(_suggestions);
    }
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: FutureBuilder(
        future: _getResults(context, query),
        builder: (context, val) {
          if (val.hasData) {
            return ListView.builder(
                itemCount: val.data.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        query = val.data[index];
                      },
                      leading: Icon(
                        FontAwesomeIcons.longArrowAltUp,
                        color: LightBlack,
                        size: 15,
                      ),
                      title: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(val.data[index]),
                      ),
                    ));
          } else
            return (query.isEmpty)
                ? ListView.builder(
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () {},
                          leading: Icon(
                            FontAwesomeIcons.longArrowAltUp,
                            color: LightBlack,
                            size: 15,
                          ),
                          title: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(suggestions[index]),
                          ),
                        ))
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: CircularProgressIndicator(
                      backgroundColor: Maroon,
                      strokeWidth: 2,
                    ),
                    alignment: Alignment.center,
                  );
        },
      ),
    );
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
        color: White,
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
    return FutureBuilder(
        future: ProductLoaderUtil.getSearchResults(context, query),
        builder: (context, val) {
          if(val.hasData && (!val.hasError))
          return SearchResultsView(
            products: val.data,
          );
          else return  Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: CircularProgressIndicator(
              backgroundColor: Maroon,
              strokeWidth: 2,
            ),
            alignment: Alignment.center,
          );
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColorDark: Maroon,
      primaryColor: Maroon,
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      accentColor: Colors.cyan[600],
      // Define the default font family.
      fontFamily: 'Georgia',
      cursorColor: White,
      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline1: TextStyle(fontWeight: FontWeight.normal, color: White),
        headline6: TextStyle(fontStyle: FontStyle.normal, color: White),
//             bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }

  Future<List<String>> _getResults(context, String query) async {
    List<String> results = new List();
    await ProductLoaderUtil.searchProducts(context, query).then((value) {
      value.forEach((element) {
        results.add(element.toString());
      });
    });
    return results;
  }
}
