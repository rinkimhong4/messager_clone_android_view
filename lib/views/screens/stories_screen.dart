import 'package:flutter/material.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  final List<String> profileImages = List.generate(
    20,
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(backgroundColor: Colors.white, body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buildStoriesRow(),
        ..._buildGridSlivers(),
      ],
    );
  }

  // SliverAppBar
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Stories',
        style: TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      pinned: true,
      floating: true,
      snap: true,
      centerTitle: false,
      actions: [Icon(Icons.switch_camera_sharp, color: Colors.black)],
    );
  }

  // Horizontal Stories Row
  Widget _buildStoriesRow() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          itemCount: profileImages.length,
          itemBuilder: (context, index) {
            bool hasStory = index % 2 == 0; // Story exists every other item
            bool isViewed = index % 3 != 0; // Viewed if not divisible by 3

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: hasStory
                              ? Border.all(
                                  color: isViewed ? Colors.grey : Colors.blue,
                                  width: 3,
                                )
                              : null,
                        ),
                        child: ClipOval(
                          child: Image.network(
                            profileImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (index == 0)
                        const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.add, size: 16, color: Colors.white),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    index == 0 ? 'Post a note' : userNames[index],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildGridSlivers() {
    return [
      SliverPadding(
        padding: const EdgeInsets.all(10),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            final mainImage = 'https://picsum.photos/id/${index + 20}/400/600';
            final profileImage = profileImages[index % profileImages.length];
            final name = index == 0 ? "Add to story" : userNames[index];
            final isUnread = index % 3 == 0; // true = unviewed

            return ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Image.network(
                      mainImage,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Container(color: Colors.grey),
                    ),
                  ),
                  // Profile picture with viewed/unviewed border
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.all(3), // border thickness
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isUnread
                              ? Colors.blue
                              : Colors.grey, // border color
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(profileImage),
                      ),
                    ),
                  ),
                  // Optional small unread indicator
                  if (isUnread)
                    Positioned(
                      top: 6,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '2',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  // Name text
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }, childCount: 20),
        ),
      ),
    ];
  }
}
