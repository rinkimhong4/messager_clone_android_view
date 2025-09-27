import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(backgroundColor: Colors.white, body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [_buildSliverAppBar(), _buildHorizontal(), _buildVerticalList()],
    );
  }

  // Use SliverAppBar for CustomScrollView
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Messager',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 28,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
        ),
      ),
      pinned: true,
      floating: true,
      snap: true,
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            spacing: 14,
            children: [
              Image.asset(
                'assets/icons/check-square.png',
                width: 24,
                height: 24,
              ),
              Icon(Icons.facebook),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontal() {
    final List<String> profileImages = List.generate(
      30,
      (index) => "https://i.pravatar.cc/150?img=${index + 1}",
    );
    final List<String?> storyNotes = [
      "Hello 👋",
      "Nh khos ey men",
      "😅",
      "Traveling ✈️",
      null,
      "At work 💻",
      null,
      "Good night 🌙",
      null,
      "😂😂",
    ];
    final List<String> userNames = [
      "Emma Watson",
      "Liam Nguyen",
      "Sophia Chen",
      "Noah Kim",
      "Olivia Smith",
      "James Lee",
      "Ava Johnson",
      "William Park",
      "Isabella Brown",
      "Lucas Tran",
      "Mia Davis",
      "Alexander Vu",
      "Charlotte Wilson",
      "Henry Le",
      "Amelia Taylor",
      "Michael Do",
      "Harper Martinez",
      "Ethan Hoang",
      "Evelyn Clark",
      "Daniel Pham",
      "Aria Lewis",
      "David Ngo",
      "Chloe Walker",
      "Joseph Huynh",
      "Emily Adams",
      "Benjamin Vo",
      "Lily Scott",
      "Mason Duong",
      "Grace Hall",
      "Logan Nguyen",
    ];

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CupertinoSearchTextField(placeholder: "Search..."),
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: profileImages.length,
              itemBuilder: (context, index) {
                bool hasStory = index % 2 == 0;
                bool isActive = index % 3 == 0;
                String? note = storyNotes[index % storyNotes.length];

                if (index == 0) {
                  // Your story (special card)
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    profileImages[index],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.25,
                                      ),
                                      blurRadius: 4,
                                      offset: const Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  CupertinoIcons.add,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Positioned(
                              top: -4,
                              left: -4,
                              child: IntrinsicWidth(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  constraints: const BoxConstraints(
                                    maxWidth: 120,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.1,
                                        ),
                                        blurRadius: 3,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Text(
                                    "Post a note",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const Text("Create Story"),
                      ],
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: hasStory
                                  ? Border.all(color: Colors.blue, width: 3)
                                  : null,
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  profileImages[index],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (isActive)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          if (note != null)
                            Positioned(
                              top: -6,
                              left: -6,
                              child: IntrinsicWidth(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  constraints: const BoxConstraints(
                                    maxWidth: 130,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.25,
                                        ),
                                        blurRadius: 6,
                                        offset: const Offset(2, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.white.withValues(
                                          alpha: 0.6,
                                        ),
                                        blurRadius: 2,
                                        offset: const Offset(-1, -1),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    note,
                                    maxLines: 2,
                                    softWrap: true,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        userNames[index % userNames.length],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalList() {
    final List<String> profileImages = List.generate(
      30,
      (index) => "https://i.pravatar.cc/150?img=${index + 1}",
    );
    final List<String> userNames = [
      "Emma Watson",
      "Liam Nguyen",
      "Sophia Chen",
      "Noah Kim",
      "Olivia Smith",
      "James Lee",
      "Ava Johnson",
      "William Park",
      "Isabella Brown",
      "Lucas Tran",
      "Mia Davis",
      "Alexander Vu",
      "Charlotte Wilson",
      "Henry Le",
      "Amelia Taylor",
      "Michael Do",
      "Harper Martinez",
      "Ethan Hoang",
      "Evelyn Clark",
      "Daniel Pham",
      "Aria Lewis",
      "David Ngo",
      "Chloe Walker",
      "Joseph Huynh",
      "Emily Adams",
      "Benjamin Vo",
      "Lily Scott",
      "Mason Duong",
      "Grace Hall",
      "Logan Nguyen",
    ];
    final List<String> messagePreviews = [
      "Hey, you free tonight? 😎",
      "Just sent you the pics! 📸",
      "Lol, that was hilarious 😂",
      "Can we meet at 6 PM?",
      "Check out this new app!",
      "Miss you! Call soon? 📞",
      "Sent you the doc, plz review",
      "Haha, you won't believe this!",
      "Dinner plans this weekend?",
      "Yo, game night tomorrow? 🎮",
      "Thanks for the help earlier!",
      "Got the tickets! 🎫",
      "What's up with you today?",
      "Let's grab coffee soon ☕",
      "Did you see the news? 😲",
      "Work's been crazy lately...",
      "Happy birthday! 🎉",
      "Can you send the link?",
      "Let's plan that trip! ✈️",
      "You tried the new place yet?",
      "Just finished the project! 🎉",
      "Call me when youre free",
      "That meme was too good 😂",
      "Meeting moved to 3 PM",
      "You coming to the party?",
      "Check your email, sent it!",
      "How's everything going?",
      "Let's catch up soon!",
      "Got any weekend plans?",
      "Thanks for the invite! 😊",
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        bool hasStory = index % 2 == 0;
        bool isUnread = index % 3 == 0;
        bool isSeen = index % 4 != 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: hasStory
                          ? LinearGradient(
                              colors: [Color(0xFF006AFF), Color(0xFF00B2FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      color: hasStory ? null : Colors.grey[200],
                    ),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: const Border.fromBorderSide(
                          BorderSide(color: Colors.white, width: 2),
                        ),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            profileImages[index % profileImages.length],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  if (isUnread)
                    Positioned(
                      bottom: 0,
                      right: 5,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 59, 176, 24),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userNames[index % userNames.length],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isUnread
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            messagePreviews[index % messagePreviews.length],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: isUnread
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (!isUnread)
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: isSeen
                                ? Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          profileImages[index %
                                              profileImages.length],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : const Icon(
                                    Icons.check_circle,
                                    size: 14,
                                    color: Color(0xFF006AFF),
                                  ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '12:0${index % 10} PM',
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
        );
      }, childCount: profileImages.length),
    );
  }
}
