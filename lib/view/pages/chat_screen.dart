import 'package:flashcard/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: chatScreenBg,
      body: Column(
        children: [
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: white),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.close),
                    Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/chatlogo.png'),
                            ),
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(color: black, fontSize: 16),
                            ),
                            Text(
                              'Online',
                              style:
                                  TextStyle(color: purpleLight, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return _buildMessageItem(index % 2 == 0);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: InwardCurveClipper(),
            child: Container(
              height: 80,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.keyboard, color: Colors.grey),
                    onPressed: () {
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 55,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: Container(
              height: 55,
              width: 55,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/chatlogo.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(bool isCurrentUser) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isCurrentUser)
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/chatlogo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(width: 8),
          Container(
            height: 150,
            width: 160,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.white : Colors.indigo.shade900,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Lorem ipsum dolor sit amet hjwjedgdfhdsgf hghfsdhdgfn  hggh...',
              style: TextStyle(
                color: isCurrentUser ? Colors.black : Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (isCurrentUser)
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/person.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class InwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.35, 0);

    // Draw the inward curve
    path.quadraticBezierTo(
      size.width * 0.5,
      40,
      size.width * 0.65,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
