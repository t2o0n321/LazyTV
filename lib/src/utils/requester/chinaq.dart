import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';

class Chinaq {
  final String baseUrl = 'https://chinaq.tv';

  Future<Map<String, String>> getSuggestLinks() async {
    final response = await http.get(Uri.parse(baseUrl));
    Map<String, String> linksMap = {};

    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      List<Element> links = document.querySelectorAll('a[href^="/xj/"]');

      for (var link in links) {
        var videoLink = baseUrl + link.attributes['href']!;

        var titleDiv = link.querySelector('.title.sizing');
        var title = titleDiv?.text.trim();
        print(title);

        var imgDiv = link.querySelector('.imgflat.cover.sizing');
        if (imgDiv == null) continue;

        var imgStyle = imgDiv.attributes['style'];
        var imgUrlMatch = RegExp(r'url\((.*?)\)').firstMatch(imgStyle!);
        var imgUrl = imgUrlMatch?.group(1);

        if (imgUrl != null) {
          linksMap[videoLink] = imgUrl;
        }
      }

      return linksMap;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}

// Future<void> main() async {
//   final chinaq = Chinaq();
//   final links = await chinaq.getSuggestLinks();
//   links.forEach((key, val) {
//     print('Link: $key, Image: $val');
//   });
// }