import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Uncomment lines 3 and 6 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Represa Perimbó',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Petrolândia, Santa Catarina - Brasil',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: const Color.fromARGB(255, 50, 163, 255),
          ),
          const Text('41'),
        ],
      ),
    );

   /* Color color = Theme.of(context).primaryColor; */
    Color cor2 = const Color.fromARGB(255, 62, 136, 206);

  Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(cor2, Icons.call, 'Ligar', '#'),
    _buildButtonColumn(cor2, Icons.message, 'Mensagem', '#'),
    _buildButtonColumn(cor2, Icons.local_library, 'Rota', 'https://www.google.com.br/maps/place/Represa+Perimb%C3%B3/@-27.6079061,-49.7319518,15z/data=!3m1!4b1!4m6!3m5!1s0x94dff49ab37219d7:0x62fcb5e7489c9258!8m2!3d-27.6079065!4d-49.7216521!16s%2Fg%2F11b6_49jt7?entry=ttu&g_ep=EgoyMDI0MTAwOC4wIKXMDSoASAFQAw%3D%3D'),
    _buildButtonColumn(cor2, Icons.share, 'Compartilhar', '#'),
  ],
);


    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Encontra-se a 10 km do centro, na Serra Grande, em Faxinal do Tigre. Antes de chegar ao local, é indispensável à parada na Serra, ponto onde se tem uma vista panorâmica da cidade, em pleno contato com a natureza. Muito procurado pelos adeptos de pesca e camping. O maior número de visitantes se dá ao final do ano e nas festividades do carnaval.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Represa Perimbó',
      debugShowCheckedModeBanner: false, //retirar tarjeta de Debug
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Represa Perimbó'),
        ),
        body: ListView(
          children: [
            /* Image.asset(
              'images/sitio.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),*/
            Image.network(
                'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/64/70/f8/ilhas-do-perimbo-camping.jpg?w=700&h=-1&s=1'),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

 
  static Widget _buildButtonColumn(Color color, IconData icon, String label, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color),
            ),
          ),
        ],
      ),
    );
  }

  static void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }
}