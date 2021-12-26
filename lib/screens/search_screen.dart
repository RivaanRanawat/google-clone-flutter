import 'package:flutter/material.dart';
import 'package:google_clone/services/api_service.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/web/web_search_header.dart';
import 'package:google_clone/widgets/search_result_component.dart';
import 'package:google_clone/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Title(
        color: Colors.blue, // This is required
        title: searchQuery,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WebSearchHeader(),
                Padding(
                  padding:
                      EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                  child: const SearchTabs(),
                ),
                const Divider(
                  height: 0,
                  thickness: 0,
                ),
                FutureBuilder<Map<String, dynamic>>(
                  future: ApiService().fetchData(
                      context: context, queryTerm: searchQuery, start: '0'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150, top: 12),
                            child: Text(
                              "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF70757a),
                              ),
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?['items'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: size.width <= 768 ? 10 : 150,
                                    top: 30),
                                child: SearchResultComponent(
                                  linkToGo: snapshot.data?['items'][index]
                                      ['link'],
                                  link: snapshot.data?['items'][index]
                                      ['formattedUrl'],
                                  text: snapshot.data?['items'][index]['title'],
                                  desc: snapshot.data?['items'][index]
                                      ['snippet'],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // HoverText(
                                //   text: "< Prev",
                                //   textStyle: TextStyle(
                                //       fontSize: 15,
                                //       color: widget.startIndex != "1"
                                //           ? Color(0xFF1a0dab)
                                //           : null),
                                //   onTap: widget.startIndex != "1"
                                //       ? () {
                                //           Navigator.pushNamed(context,
                                //               '/search?q=${widget.q}&start=${int.parse(widget.startIndex) - 10}');
                                //         }
                                //       : null,
                                // ),
                                SizedBox(width: 30),
                                // HoverText(
                                //   text: "Next >",
                                //   textStyle: TextStyle(
                                //       fontSize: 15, color: Color(0xFF1a0dab)),
                                //   onTap: () {
                                //     Navigator.pushNamed(context,
                                //         '/search?q=${widget.q}&start=${int.parse(widget.startIndex) + 10}');
                                //   },
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          const SearchFooter(),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
