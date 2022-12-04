import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/chatPage.dart';
import 'package:flutter_whatsapp/profil.dart';
import 'package:google_fonts/google_fonts.dart';

const cvert = Color(0xFF2ac0a6);
const cblanc = Colors.white;
const cnoir = Colors.black;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: cnoir,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          MenuSection(),
          FavoriteSection(),
          Expanded(
            child: MessageSection(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cvert,
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}

//------------------- SECTION NAVBAR -------------------------------------------

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  final String nom = "Abdoulaziz";
  final String image = "assets/images/gavi.jpg";
  final String email = "maigaabdoulaziz795@gmail.com";
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              profil(context),
              menu(context),
            ],
          ),
        ),
      );

  Widget profil(BuildContext context) => Material(
        color: cvert,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Profil(nom: nom, image: image)));
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/gavi.jpg'),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  nom,
                  style: GoogleFonts.inter(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  email,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      );
  Widget menu(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
//--------------------- Pour pouvoir donner de spacement vertical --------------
        child: Wrap(
          runSpacing: 10, // verticale
          children: [
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                // size: 25,
              ),
              title: const Text(
                "Accueil",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const App()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.chat_bubble_outline,
                // size: 25,
              ),
              title: const Text(
                "Chats",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChatPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications_outlined,
                // size: 25,
              ),
              title: const Text(
                "Notifications",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.group_outlined,
                // size: 27,
              ),
              title: const Text(
                "Groupes",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
// ------------------ SEPARATEUR -----------------------------------------------
            const Divider(
              color: cnoir,
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite_outline,
                // size: 27,
              ),
              title: const Text(
                "Status",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.call_outlined,
                // size: 27,
              ),
              title: const Text(
                "Appels",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                // size: 27,
              ),
              title: const Text(
                "Paramettres",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
          ],
        ),
      );
}

//------------------- SECTION MENU -------------------------------------------

class MenuSection extends StatelessWidget {
  final List itemMenu = ["Message", "Groupes", "Status", "Appels"];
  MenuSection({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: cnoir,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: itemMenu.map((item) {
              return Container(
                margin: const EdgeInsets.only(right: 30),
                child: Text(
                  item,
                  style: GoogleFonts.inter(color: Colors.white70, fontSize: 22),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

//------------------- SECTION FAVORIES -------------------------------------------

class FavoriteSection extends StatelessWidget {
  final List contactFavories = [
    {
      "nom": "Neymar",
      "photo": "assets/images/neymar.jpg",
    },
    {
      "nom": "Messi",
      "photo": "assets/images/messi.jpg",
    },
    {
      "nom": "Cristiano",
      "photo": "assets/images/cr7.jpg",
    },
    {
      "nom": "Gavi",
      "photo": "assets/images/gavi.jpg",
    },
    {
      "nom": "Pedri",
      "photo": "assets/images/pedri.jpg",
    },
    {
      "nom": "Gavi",
      "photo": "assets/images/gavi.jpg",
    },
    {
      "nom": "Pedri",
      "photo": "assets/images/pedri.jpg",
    },
    {
      "nom": "Haland",
      "photo": "assets/images/haland.jpg",
    },
    {
      "nom": "Neymar",
      "photo": "assets/images/neymar.jpg",
    },
  ];
  FavoriteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cnoir,
      child: Container(
        // height: 100,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: cvert,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text(
                      "Contacts Favories",
                      style: TextStyle(fontSize: 18, color: cblanc),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz, color: cblanc))
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: contactFavories.map((favorie) {
                  return Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              color: cblanc,
                              // Pour le cicle blanc deriere l'image  "grace à la padding "
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                                // radius: 20,
                                backgroundImage: AssetImage(favorie['photo'])),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            favorie['nom'],
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, color: cblanc),
                          ),
                        ],
                      ));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//------------------- SECTION MESSAGES -------------------------------------------

class MessageSection extends StatelessWidget {
  final List messages = [
    {
      "sonProfile": "assets/images/neymar.jpg",
      "sonNom": "Abdoulaziz",
      "sms": "Où est tu ?",
      "nonLu": 4,
      "date": "19:09"
    },
    {
      "sonProfile": "assets/images/neymar.jpg",
      "sonNom": "Maiga",
      "sms": "çava",
      "nonLu": 7,
      "date": "14:45"
    },
    {
      "sonProfile": "assets/images/neymar.jpg",
      "sonNom": "Neymar",
      "sms": "Madame Bonjour",
      "nonLu": 0,
      "date": "20:12"
    },
    {
      "sonProfile": "assets/images/neymar.jpg",
      "sonNom": "Aziz",
      "sms": "çava",
      "nonLu": 3,
      "date": "17:05"
    },
    {
      "sonProfile": "assets/images/neymar.jpg",
      "sonNom": "Abdoul jr",
      "sms": "çava",
      "nonLu": 0,
      "date": "08:31"
    },
    {
      "sonProfile": "assets/images/neymar.jpg",
      "sonNom": "Njr",
      "sms": "çava",
      "nonLu": 0,
      "date": " 15:48"
    },
    {
      "sonProfile": "assets/images/neymar.jpg",
      "sonNom": "Zizo",
      "sms": "Vient à la maison",
      "nonLu": 2,
      "date": "10:15"
    },
    {
      "sonProfile": "assets/images/neymar.jpg",
      "sonNom": "Abdoul",
      "sms": "Comment va tu ?",
      "nonLu": 0,
      "date": "06:55"
    },
  ];
  MessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: messages.map((message) {
          return InkWell(
            splashColor: cvert,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatPage()));
            },
            child: Container(
              height: 80,
              padding: const EdgeInsets.only(left: 30, right: 10, top: 15),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: cvert,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                            message['sonProfile'],
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message['sonNom'],
                                  style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      message['sms'],
                                      style: GoogleFonts.inter(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(message['date']),
                                const SizedBox(
                                  height: 3,
                                ),
                                message['nonLu'] != 0
                                    ? Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          color: cvert,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          message['nonLu'].toString(),
                                          style: GoogleFonts.inter(
                                              color: cblanc,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      )
                                    : Container(),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.grey,
                          height: 0.5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
