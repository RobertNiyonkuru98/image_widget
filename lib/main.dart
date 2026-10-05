import 'package:flutter/material.dart';

const String _imgUrl =
    'https://images.unsplash.com/photo-1505506874110-6a7a69069a08?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

void main() => runApp(MaterialApp(home: ImagesPage()));

class ImagesPage extends StatelessWidget {
  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Properties', style: TextStyle(
          color: Colors.black,
          fontFamily: 'Isometra',
          )),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ─── width & height ─────────────────────────────────────
          _section('width: 150, height: 150'),
          const SizedBox(height: 8),
          Image.network(_imgUrl, width: 150, height: 150),

          const SizedBox(height: 24),

          // ─── fit ────────────────────────────────────────────────
          _section('fit: BoxFit.cover (150×150)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl, width: 150, height: 150, fit: BoxFit.cover),

          const SizedBox(height: 24),
          _section('fit: BoxFit.contain (150×150)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl, width: 150, height: 150, fit: BoxFit.contain),

          const SizedBox(height: 24),
          _section('fit: BoxFit.fill (150×150)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl, width: 150, height: 150, fit: BoxFit.fill),

          const SizedBox(height: 24),
          _section('fit: BoxFit.fitWidth (width: 200)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl, width: 200, fit: BoxFit.fitWidth),

          const SizedBox(height: 24),
          _section('fit: BoxFit.fitHeight (height: 100)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl, height: 100, fit: BoxFit.fitHeight),

          const SizedBox(height: 24),
          _section('fit: BoxFit.scaleDown (width: 100, height: 100)'),
          const SizedBox(height: 8),
          Image.network(
              _imgUrl, width: 100, height: 100, fit: BoxFit.scaleDown),

          const Divider(height: 32),

          // ─── color & colorBlendMode ─────────────────────────────
          _section('color: blue, colorBlendMode: multiply'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 150, height: 150, fit: BoxFit.cover,
              color: Colors.blue, colorBlendMode: BlendMode.multiply),

          const SizedBox(height: 24),
          _section('color: red, colorBlendMode: screen'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 150, height: 150, fit: BoxFit.cover,
              color: Colors.red, colorBlendMode: BlendMode.screen),

          const SizedBox(height: 24),
          _section('color: green, colorBlendMode: overlay'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 150, height: 150, fit: BoxFit.cover,
              color: Colors.green, colorBlendMode: BlendMode.overlay),

          const Divider(height: 32),

          // ─── alignment ──────────────────────────────────────────
          _section('alignment: topLeft (200×150, fit: none)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 200, height: 150,
              fit: BoxFit.none, alignment: Alignment.topLeft),

          const SizedBox(height: 24),
          _section('alignment: bottomRight (200×150, fit: none)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 200, height: 150,
              fit: BoxFit.none, alignment: Alignment.bottomRight),

          const Divider(height: 32),

          // ─── opacity ────────────────────────────────────────────
          _section('opacity: 0.3 (via AlwaysStoppedAnimation)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 150, height: 150, fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation<double>(0.3)),

          const Divider(height: 32),

          // ─── repeat ─────────────────────────────────────────────
          _section('repeat: ImageRepeat.repeat (fit: none, 200×200)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 200, height: 200,
              fit: BoxFit.none, repeat: ImageRepeat.repeat),

          const Divider(height: 32),

          // ─── filterQuality & isAntiAlias ────────────────────────
          _section('filterQuality: low, isAntiAlias: false (width: 200)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 200, fit: BoxFit.cover,
              filterQuality: FilterQuality.low, isAntiAlias: false),

          const SizedBox(height: 24),
          _section('filterQuality: high, isAntiAlias: true (width: 200)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 200, fit: BoxFit.cover,
              filterQuality: FilterQuality.high, isAntiAlias: true),

          const Divider(height: 32),

          // ─── loadingBuilder ─────────────────────────────────────
          _section('loadingBuilder (spinner while loading)'),
          const SizedBox(height: 8),
          Image.network(
            _imgUrl,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Container(
                width: 150,
                height: 150,
                color: Colors.grey[300],
                child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2)),
              );
            },
          ),

          const Divider(height: 32),

          // ─── errorBuilder ───────────────────────────────────────
          _section('errorBuilder (intentionally broken URL)'),
          const SizedBox(height: 8),
          Image.network(
            'https://invalid-url-that-does-not-exist-xyz.com/broken.jpg',
            width: 150,
            height: 150,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 150,
              height: 150,
              color: Colors.red[100],
              child: const Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image, size: 40, color: Colors.red),
                      SizedBox(height: 8),
                      Text('Failed to load', style: TextStyle(color: Colors.red)),
                    ]),
              ),
            ),
          ),

          const Divider(height: 32),

          // ─── scale ──────────────────────────────────────────────
          _section('scale: 2.0 (image appears half-size, width: 200)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl, width: 200, height: 150,
              fit: BoxFit.cover, scale: 2.0),

          const Divider(height: 32),

          // ─── semanticLabel ──────────────────────────────────────
          _section('semanticLabel: "A space photo" (accessibility)'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 150, height: 150, fit: BoxFit.cover,
              semanticLabel: 'A space photo'),

          const SizedBox(height: 24),
          _section('excludeFromSemantics: true'),
          const SizedBox(height: 8),
          Image.network(_imgUrl,
              width: 150, height: 150, fit: BoxFit.cover,
              excludeFromSemantics: true),

          const Divider(height: 32),

          // ─── matchTextDirection ─────────────────────────────────
          _section('matchTextDirection: true (in RTL context)'),
          const SizedBox(height: 8),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Image.network(_imgUrl,
                width: 200, height: 100,
                fit: BoxFit.none, matchTextDirection: true),
          ),

          const SizedBox(height: 40),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.tealAccent,
        child: const Text('click'),
      ),
    );
  }
}

Widget _section(String label) => Padding(
  padding: const EdgeInsets.only(bottom: 4),
  child: Text(label,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 13, color: Colors.blueGrey)),
);
