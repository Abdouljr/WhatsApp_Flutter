import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/main.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cnoir,
      appBar: AppBar(
        backgroundColor: cnoir,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: IconButton(
                onPressed: (() {}),
                icon: const Icon(Icons.more_vert),
              )),
        ],
      ),
      bottomNavigationBar: const BottonSection(),
      body: const ChatSection(),
    );
  }
}

// ------------------------- BOTTOM NAVIGATION BAR ----------------------------

class BottonSection extends StatelessWidget {
  const BottonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        height: 90,
        color: cblanc,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 45,
                decoration: const BoxDecoration(
                  color: cvert,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.insert_emoticon,
                      size: 25,
                      color: cblanc,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    Icon(
                      Icons.upload_outlined,
                      size: 25,
                      color: cblanc,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.image,
                      size: 25,
                      color: cblanc,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                color: cvert,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.mic_none_sharp,
                color: cblanc,
              ),
            ),
          ],
        ));
  }
}

// ------------------------- SECTION DE CHAT ----------------------------------

class ChatSection extends StatelessWidget {
  final String senderProfile = 'assets/images/messi.jpg';
  final String receiverProfile = 'assets/images/neymar.jpg';
  const ChatSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: cblanc,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            "Abdoulaziz Maîga",
            style: GoogleFonts.inter(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Etait en ligne il y a 56 secondes",
            style: GoogleFonts.inter(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 45),
          TextMessage(
            message: "Mois sur vous à par l’estime",
            date: "17:19",
            senderProfile: receiverProfile,
            isReceiver: 1,
            isDirect: 0,
          ),
          TextMessage(
            message: "Je t’ai vu regarder mon fils",
            date: "17:13",
            senderProfile: senderProfile,
            isReceiver: 0,
            isDirect: 0,
          ),
          TextMessage(
            message: "Comme le recommande tolérablement sans vergogne",
            date: "17:10",
            senderProfile: senderProfile,
            isReceiver: 0,
            isDirect: 1,
          ),
          TextMessage(
            message: "Elle bien que joyeuse perçoivent",
            date: "17:10",
            senderProfile: receiverProfile,
            isReceiver: 1,
            isDirect: 0,
          ),
          const ImageMessage(
            image: 'assets/images/pedri.jpg',
            date: "17:09",
            description:
                "Au moins leur elle vous maintenant au-dessus d’aller debout",
          ),
          AudioMessage(date: "18:05", senderProfile: senderProfile),
          TextMessage(
            message: "Provided put unpacked now but bringing. ",
            date: "16:59",
            senderProfile: receiverProfile,
            isReceiver: 1,
            isDirect: 0,
          ),
          TextMessage(
            message: "On dirait que c’est moi",
            date: "16:53",
            senderProfile: receiverProfile,
            isReceiver: 0,
            isDirect: 0,
          ),
          TextMessage(
            message: "Ensuite il dessine dans le dessin beaucoup élevé",
            date: "16:50",
            senderProfile: receiverProfile,
            isReceiver: 0,
            isDirect: 1,
          ),
          TextMessage(
            message: "Bien sûr que cette façon a donné",
            date: "16:48",
            senderProfile: senderProfile,
            isReceiver: 1,
            isDirect: 0,
          ),
          const SizedBox(height: 15),
        ],
      )),
    );
  }
}

// ------------------------- TEXT MESSAGE -------------------------------------

class TextMessage extends StatelessWidget {
  final String message, date, senderProfile;
  final int isReceiver, isDirect;
  const TextMessage(
      {super.key,
      required this.message,
      required this.date,
      required this.senderProfile,
      required this.isReceiver,
      required this.isDirect});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        children: [
// -------------------- Si on reçoit le message -------------------------------
          isReceiver == 1 && isDirect == 0
              ? Container(
                  margin: const EdgeInsets.only(right: 18),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: cvert,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(senderProfile),
                      fit: BoxFit.cover,
                    ),
                  ),
                )

// -------------------- Si on envoi le message ---------------------------------
              : SizedBox(
                  width: 60,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check,
                        color: cvert,
                        size: 16.0,
                      ),
                      const SizedBox(width: 7.0),
                      Text(
                        date,
                        style: GoogleFonts.inter(
                          color: cvert,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
//  ------------Marge  Si on reçoit 25 à droite sinon 20 à gauche --------------
              margin: isReceiver == 1
                  ? const EdgeInsets.only(
                      right: 25,
                    )
                  : const EdgeInsets.only(
                      left: 20,
                    ),
              padding: const EdgeInsets.all(6),
              height: 55,
//  ------------Marge  Si on reçoit  --------------------------- --------------
              decoration: isReceiver == 1
                  ? const BoxDecoration(
                      color: cblanc,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    )
//  ------------Marge  Si on envoi  --------------------------- --------------
                  : const BoxDecoration(
                      color: cvert,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
              child: Text(
                message,
                style: GoogleFonts.inter(
                  color: isReceiver == 1 ? cvert : cblanc,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
// ----------------------- SI on reçoit un seul message ------------------------
          isReceiver == 1 && isDirect == 0
              ? SizedBox(
                  width: 60,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check,
                        color: cvert,
                        size: 16.0,
                      ),
                      const SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        date,
                        style: GoogleFonts.inter(
                          color: cvert,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
// ----------------------- SI on envoi un seul message ------------------------
          isDirect == 0 && isReceiver == 0
              ? Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 10,
                  ),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(senderProfile),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(),
// ----------------------- SI on envoi des messages successifs -----------------
// ----------------------- On affiche pas le profil deux fois ------------------
          isReceiver == 0 && isDirect == 1
              ? Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 10,
                  ),
                  width: 45,
                  height: 45,
                )
              : Container(),
        ],
      ),
    );
  }
}

// ------------------------- AUDIO MESSAGE -------------------------------------

class AudioMessage extends StatelessWidget {
  final String date, senderProfile;
  const AudioMessage(
      {super.key, required this.date, required this.senderProfile});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 60,
          child: Row(
            children: [
              Text(
                "17:14",
                style: GoogleFonts.inter(
                  color: cvert,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 7.0),
              const Icon(
                Icons.check,
                color: cvert,
                size: 13.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              left: 15,
              bottom: 5,
            ),
            padding: const EdgeInsets.all(6),
            height: 55,
            decoration: const BoxDecoration(
              color: cvert,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const IconButton(
                    icon: Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                    ),
                    onPressed: null,
                  ),
                  Image.asset(
                    'assets/images/audio.png',
                    height: 35,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 10,
          ),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: cblanc,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(senderProfile),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

// ------------------------- IMAGE MESSAGE -------------------------------------

class ImageMessage extends StatelessWidget {
  final String image, date, description;
  const ImageMessage(
      {super.key,
      required this.image,
      required this.date,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 16,
          ),
          width: 45,
          height: 45,
        ),
        Expanded(
          child: Column(
            children: [
// ------------------------ IMAGE ----------------------------------------------
              Container(
                margin: const EdgeInsets.only(
                  right: 26,
                  top: 5,
                ),
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(22.0),
                  ),
                ),
              ),
// ------------------------ DESCRIPTION  ---------------------------------------
              Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  right: 25,
                  bottom: 10,
                ),
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                height: 55,
                decoration: const BoxDecoration(
                  color: cblanc,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Wrap(children: [
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: cvert,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
// ------------------------ DATE ----------------------------------------------
        SizedBox(
          width: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.check,
                color: cvert,
                size: 16.0,
              ),
              const SizedBox(width: 7.0),
              Text(
                "17:14",
                style: GoogleFonts.inter(
                  color: cvert,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
