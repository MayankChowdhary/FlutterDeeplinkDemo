import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ImagePost extends StatelessWidget {
  final String imageUrl;

  const ImagePost({super.key, required this.imageUrl});

  void _shareImage(BuildContext context) {
    Share.share("https://mayank-portfolio72.netlify.app/imagepost");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Display the online image
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child:
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: const Text("Wonder of the world Petra"),
            subtitle: const Text("Famous for its rock-cut architecture and water conduit systems, Petra is also called the Rose City"),
            trailing: IconButton(
              iconSize: 40,
              icon: const Icon(Icons.share),
              color: Colors.blue,
              onPressed: () => _shareImage(context),
            ),
          ),
        ],
      ),
    );
  }
}
