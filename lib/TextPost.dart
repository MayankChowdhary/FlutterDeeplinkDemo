import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TextPost extends StatelessWidget {
  const TextPost({super.key});

  void _shareText(BuildContext context, String text) {
    Share.share("https://mayank-portfolio72.netlify.app/textpost");
  }

  @override
  Widget build(BuildContext context) {
    var myText =
        "The vintage era, often characterized by styles and aesthetics from the late 19th to mid-20th century, evokes a sense of nostalgia and charm. This period witnessed significant cultural changes, marked by the rise of jazz music, classic films, and iconic fashion trends, such as flapper dresses and tailored suits. Vintage items, from furniture to clothing, reflect craftsmanship and quality, emphasizing unique design over mass production. The allure of vintage extends to various domains, including art, decor, and automobiles, often celebrated for their timeless appeal. Today, vintage culture thrives through thrift stores, antique markets, and retro-themed events, bringing the elegance of the past into contemporary life.";
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Display the online image
          Expanded(
              child: Scrollbar(
            thickness: 8.0,
            radius: const Radius.circular(10),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                myText,
                style: const TextStyle(
                  fontSize: 24, // Font size
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue, // Text color
                ),
              ),
            ),
          )),
          ListTile(
            title: Text("Vintage Era"),
            subtitle: Text("19th and 20th Century know as Vintage Era"),
            trailing: IconButton(
              iconSize: 40,
              icon: const Icon(Icons.share),
              color: Colors.blue,
              onPressed: () => _shareText(context,myText),
            ),
          ),
        ],
      ),
    );
  }
}
